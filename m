Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BDD1F8560
	for <lists+samba-technical@lfdr.de>; Sat, 13 Jun 2020 23:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aqsHtEoW4+6qr9tm/esGKx6WiWYudSCEpptzraWCCbo=; b=jwmGjuTwk2YGBvC0q0qx2SzJ7c
	f+vHH1UJL6NBpxOG+1G/JLNO74ugxEhsYGGMWctTdAfgdzvoIzrTWoYMrT2uVulEocuYVXm0LOkns
	+2L/lB2PxDz4m4hyEwHDrcWKEJa1gvcendlXAS+nNf8/TGehax6pwIZ2oqgYK3mrBLorJhTzDqUWk
	M1G8U1DmEdC4UZ+W56GpAFFJeqxCn4NFbB7LAiNGaPVlryV4aeK2ule/5Nak6JQcaCYzM0DRmBigy
	FCZOFBuZc60rk8NdkrRPgZxO8XHSzc/7pPDEw8kJ4LfaSpHmqRxyxr0P/sgv93OE7puyJfZiwh8xN
	BL3TeCWw==;
Received: from localhost ([::1]:55536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jkDUn-000GNB-9N; Sat, 13 Jun 2020 21:15:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkDUf-000GN2-Fl
 for samba-technical@lists.samba.org; Sat, 13 Jun 2020 21:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=aqsHtEoW4+6qr9tm/esGKx6WiWYudSCEpptzraWCCbo=; b=n3VDEQhy9rhKGBPcXIvLqHXYuA
 TLx3uYEtY3DJ/W1/Xu5dKyKCp6HpZxkhPf+5XzpFcnABHRe2tuRuJ+Z4+y+qGNGw9vnBCdFhm28fH
 WN8xtI9fn2YbMOloSxRtbox6yM4qoMgxJSAjDjHyrIjAvh5o8s4MthnQSXGPz3+p2GBG9Gw6pXgKw
 0kspciaQGnPsO8023xvjPl7l4ojVPv8L70NwxrWuHbmB/KCy0FWyoaxj/jvCEMYMq/IYeE6+o9ZZD
 ePI8lZmZkwCg5OTxcImW78Ro00RQAlVudercMpiuQTkocW24v/Js+OsSdUuoOdOrPvy25qJzs+07+
 ErY50om8DJo7LHXTltYQ1qenM2H2JpYGOLyRwfTmliXeSkoKcVvMWNxwqvzExwUf6FAQYylzGi1t/
 gl7Z0j6YTQKisCQNOkDr3RLxXNQ7sil1t4s3UuqOLV13ysBYu+pfV+i2ptSKyuayDbFkrn1tZD8ZT
 CmpjSlj6jxynPihwZFnVJc++;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkDUc-0003GV-84; Sat, 13 Jun 2020 21:15:11 +0000
Date: Sun, 14 Jun 2020 00:15:07 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020: Week 1 and Week 2 Progress
Message-ID: <20200613211507.GB3036357@onega.vda.li>
References: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
 <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hezekiah,

On to, 11 kesä 2020, hezekiah maina via samba-technical wrote:
> Sorry I didn't to give the link to the repo:
> Here it is: https://gitlab.com/HezekiahM/samba-ad-dc

Great to see quite a progress, thank you.

I deployed it on Fedora 32, here my notes:

- I had to create src/css or otherwise webpack did not complete
  successfully

- I needed to patch webpack.config.js to allow webpack to
  finish linking the code

- On Fedora Cockpit does have patternfly.css as patternfly.min.css, I
  had to change the reference

- There are some issues with the content security policy so I added one,
  may be it is not needed

- one needs to provision the domain first or loading the app never
  completes, this is because you never set addcStatus to 'false' in case
  testparm doesn't return "active directory domain controller" for the
  'server role'

- once provisioned, the app starts showing separate pages but I wasn't
  able to retrieve the domain details from the 127.0.0.1 IP address

There is something wrong with the state update -- at least, I was not able
to see values updated from the forms. This can be seen with domain info,
for example -- since ipAddress state is undefined by default, it is not
updated and 'samba-tool domain info ${ipAddress}' fails:

An Error Occurred
ERROR: Invalid IP address 'undefined'!

I'm attaching some of my fixes, feel free to check them.

It is a promising start, great to see it.  Please add breadcrumbs to
return back to the previous level from each separate page (e.g. from
samba-ad-dc/users/index.html to main page in samba-ad-dc/index.html, for
example). This would allow moving back and forth without reloading the
page.

Looking forward to next week update. ;)

> 
> On Thu, Jun 11, 2020 at 10:31 AM hezekiah maina <hezekiahmaina3@gmail.com>
> wrote:
> 
> > Hi Members,
> >
> > I wanted to give you an update on my progress for the work I'm doing during
> > the GSoC 2020.
> > Week 1:
> >  I worked on some bits of the following:
> >   Computer Management - List, Create, Delete and Showing the AD Object
> >   Time - Showing the current time on the Server
> >    Domain Management - Provisioning and Domain Information.
> >    Sites Management - Creating and Deleting
> >    Contact Management - List, Create, Show and Delete Contact
> > Week 2:
> >  I have been working on the following:
> >  User Management - Creating and Listing Users
> > I will continue working on the same and hopefully write tests for the app
> > before the end of the week.
> >
> >


-- 
/ Alexander Bokovoy

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="temp.patch"

diff --git a/Makefile b/Makefile
index 7caed7d..ae9be53 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ TEST_OS = centos-7
 endif
 export TEST_OS
 TARFILE=cockpit-$(PACKAGE_NAME)-$(VERSION).tar.gz
-RPMFILE=$(shell rpmspec -D"VERSION $(VERSION)" -q cockpit-starter-kit.spec.in).rpm
+RPMFILE=$(shell rpmspec -D"VERSION $(VERSION)" -q cockpit-samba-ad-dc.spec.in).rpm
 VM_IMAGE=$(CURDIR)/test/images/$(TEST_OS)
 # stamp file to check if/when npm install ran
 NODE_MODULES_TEST=package-lock.json
diff --git a/src/ad-dc-status.js b/src/ad-dc-status.js
index a5bd342..7ff6531 100644
--- a/src/ad-dc-status.js
+++ b/src/ad-dc-status.js
@@ -16,6 +16,8 @@ export default function GetServerRole() {
                 .then((data) => {
                     if (data.includes("active directory domain controller")) {
                         setAdDcStatus(true);
+                    } else {
+                        setAdDcStatus(false);
                     }
                 })
                 .catch((exception) => {
diff --git a/src/computer/computer.html b/src/computer/computer.html
index 5ef3fbd..9563204 100644
--- a/src/computer/computer.html
+++ b/src/computer/computer.html
@@ -3,10 +3,10 @@
     <title translate>Computer</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/src/contact/contact.html b/src/contact/contact.html
index 4cbbc51..e4167b2 100644
--- a/src/contact/contact.html
+++ b/src/contact/contact.html
@@ -3,10 +3,10 @@
     <title translate>Computer</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/src/domain/domain.html b/src/domain/domain.html
index 361ca53..6e215d2 100644
--- a/src/domain/domain.html
+++ b/src/domain/domain.html
@@ -3,10 +3,10 @@
     <title translate>Domain</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/src/index.html b/src/index.html
index e0a3ed5..4fc93b7 100644
--- a/src/index.html
+++ b/src/index.html
@@ -6,10 +6,10 @@
     <meta name="description" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1">
 
-    <link rel="stylesheet" href="../base1/patternfly.css">
+    <link rel="stylesheet" href="../base1/patternfly.min.css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
 </head>
diff --git a/src/sites/sites.html b/src/sites/sites.html
index f20b23f..89c6c2e 100644
--- a/src/sites/sites.html
+++ b/src/sites/sites.html
@@ -3,10 +3,10 @@
     <title translate>Sites</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/src/time/time.html b/src/time/time.html
index 5057411..3d9049a 100644
--- a/src/time/time.html
+++ b/src/time/time.html
@@ -3,10 +3,10 @@
     <title translate>Time</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/src/user/user.html b/src/user/user.html
index 13e4905..47dfe2d 100644
--- a/src/user/user.html
+++ b/src/user/user.html
@@ -3,10 +3,10 @@
     <title translate>User Management</title>
     <meta charset="utf-8">
 
-    <link rel="stylesheet" href="../../base1/patternfly.css" type="text/css">
+    <link rel="stylesheet" href="../../base1/patternfly.min.css" type="text/css">
     <link rel="stylesheet" href="index.css">
 
-    <script type="text/javascript" src="../../base1/cockpit.js"></script>
+    <script type="text/javascript" src="../../base1/cockpit.min.js"></script>
     <script type="text/javascript" src="../../*/po.js"></script>
     <script type="text/javascript" src="index.js"></script>
   </head>
diff --git a/webpack.config.js b/webpack.config.js
index 2f1531d..b1bee30 100644
--- a/webpack.config.js
+++ b/webpack.config.js
@@ -105,7 +105,7 @@ Object.keys(info.entries).forEach(function(key) {
 var files = [];
 info.files.forEach(function(value) {
     if (!section || value.indexOf(section) === 0)
-        files.push({ from: vpath("src", value), to: value });
+        files.push({ from: vpath(value), to: value });
 });
 info.files = files;
 

--u3/rZRmxL6MmkK24--

