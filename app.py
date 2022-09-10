from datetime import datetime
from email import message
from turtle import title
from flask import Flask ,render_template ,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
from flask_mail import Mail
from werkzeug.utils import secure_filename
import os
import math
import _tkinter as Tk
import turtle as tu



with open("config.json","r") as f:
    
     params=json.load(f)["parameters"]
     
     
app = Flask(__name__) #creating the Flask class object
app.secret_key = 'the random string'
app.config['UPLOAD_FOLDER']='C:\\Users\\Dell\\Desktop\\Programming\\flask\\static\\img'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)

mail = Mail(app)
   
app.config ['SQLALCHEMY_DATABASE_URI'] = os.environ.get("DATABASE_URL")

db = SQLAlchemy(app)
class contacts(db.Model):
    #S.No name email phone_num msg date
   SNo= db.Column(db.Integer, primary_key = True)
   name = db.Column(db.String(100),unique=False,nullable=False)
   email = db.Column(db.String(50),unique=False,nullable=False)  
   phone_num = db.Column(db.String(20),unique=False,nullable=False)
   msg = db.Column(db.String(20),unique=False,nullable=False)
   date = db.Column(db.String(20),unique=False,nullable=False)
   
class Posts(db.Model):
    #S.No name email phone_num msg date
   S_No= db.Column(db.Integer, primary_key = True)
   title = db.Column(db.String(30),unique=False,nullable=False)
   slug = db.Column(db.String(50),unique=True,nullable=False)  
   content = db.Column(db.String(20),unique=False,nullable=False)
   date = db.Column(db.String(20),unique=False,nullable=False)  
   subtitle = db.Column(db.String(30),unique=False,nullable=False)  

@app.route('/post/<string:postslug>', methods=['GET'])
def post_route(postslug):
    slug2 = str(postslug)
    post = Posts.query.filter_by(slug = slug2).first()
    post.content=post.content[75:]
    return render_template('post.html', params=params, post=post)

@app.route("/edit/<string:sno>",methods=['GET','POST']) 
def edit(sno):  
 if "user" in session and session["user"]=="user-name":   
    if request.method=="POST":
       box_title=request.form.get("Title") 
       box_content=request.form.get("Content") 
       box_slug=request.form.get("slug")
       box_subtitle=request.form.get("Subtitle") 
       if sno=="0":
           post=Posts(subtitle=box_subtitle,title=box_title,slug=box_slug,content=box_content,date=datetime.now()) 
           db.session.add(post)  
           db.session.commit() 
           sno=0   
       else:
           post.title=box_title
           post.content=box_content
           post.slug=box_slug 
           post.subtitle=box_subtitle
           db.session.commit()
     
    post = Posts.query.filter_by(S_No=sno).first()
    return render_template('edit.html', params=params, post=post,sno=sno)   
    
@app.route("/contact",methods=['GET','POST']) 
def contact():
    if request.method=="POST":
       name=request.form.get('name')
       email=request.form.get('email')
       phone_num=request.form.get('phone_num')
       message=request.form.get('message')
    
       entry=contacts(name=name,email=email,phone_num=phone_num,msg=message)
       db.session.add(entry)
       db.session.commit()
       mail.send_message("This is a mail from blog",sender=email,recipients=[params["gmail-user"]],body=message+"\n"+phone_num)
    post=Posts.query.filter_by(slug="first-post").first()   
    return render_template("contact.html",params=params,post=post)  
    
      
@app.route('/') #decorator drfines the   
def home():    
     allposts=Posts.query.filter_by().all()
     last=math.ceil(len(allposts)/params["noofposts"])
    
     page=request.args.get('page')
     if not str(page).isnumeric():
       page=1
     page=int(page)
    
     posts=allposts[(page-1)*int(params["noofposts"]) : (page-1)*int(params["noofposts"])+int(params["noofposts"]) ]
    
     if page==1:
       prev = "#"
       next = "?page="+ str(page+1)
     elif page==last:
       prev = "?page="+ str(page-1)
       next = "#"
     else:
       prev = "?page="+ str(page-1)
       next = "?page="+ str(page+1)
            
     return render_template("index.html",params=params,posts=posts,next=next,prev=prev);  
 
@app.route("/about")
def about():
   return render_template("about.html",params=params)

@app.route("/dashboard",methods=["GET","POST"])
def dashboard():
   posts=Posts.query.filter_by().all() 
   if "user" in session and session["user"]=="user-name":
          return render_template("admin.html",posts=posts,params=params)
   if request.method=="POST":
      if request.form.get("email_login")==params["admin-mail"] and request.form.get("pass_login")==params["admin-password"]:
          session["user"]="user-name"
          return render_template("admin.html",posts=posts,params=params)
          
      
   else:     
        return render_template("login.html",params=params)


@app.route("/index")
def index():
      allposts=Posts.query.filter_by().all()
      last=math.ceil(len(allposts)/params["noofposts"])
    
      page=request.args.get('page')
      if not str(page).isnumeric():
       page=1
      page=int(page)
    
      posts=allposts[(page-1)*int(params["noofposts"]) : (page-1)*int(params["noofposts"])+int(params ["noofposts"]) ]
    
      if page==1:
       prev = "#"
       next = "?page="+ str(page+1)
      elif page==last:
       prev = "?page="+ str(page-1)
       next = "#"
      else:
       prev = "?page="+ str(page-1)
       next = "?page="+ str(page+1)
            
      return render_template("index.html",params=params,posts=posts,next=next,prev=prev);  
 
 

@app.route("/uploader",methods=["GET","POST"])
def uploadfile():
    if "user" in session and session["user"]=="user-name":
        if request.method=="POST": 
           f = request.files['file1']
           f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
           return "Uploaded file successfully!"
       
       

@app.route("/logout")
def logout():
    if "user" in session and session["user"]=="user-name":
       session.pop("user")
       return render_template("login.html")   
   
   
@app.route("/delete/<string:sno>",methods=['GET','POST']) 
def delete(sno):  
 if "user" in session and session["user"]=="user-name":
     post=Posts.query.filter_by(S_No=sno).first()
     db.session.delete(post)
     db.session.commit()
 return redirect("/dashboard")        

      
app.run(debug = True)