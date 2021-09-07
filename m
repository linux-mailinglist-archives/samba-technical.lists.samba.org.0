Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A9402BBD
	for <lists+samba-technical@lfdr.de>; Tue,  7 Sep 2021 17:27:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ObkTc/oaZnlxmJG6K/fRnKFJNgagt9Qdzf3/ahtwGzw=; b=VUfRVBhRingMF+/UaC9oqaixEQ
	kk/nkAcGXM9Z3q8btSbWetfi4yqMeUdIV6N6O6AzXk8JFvTtCfniqQQ3+Em1azeCuSUnQRGF1oSMt
	TWfEqcwjW3bea9f0hkjPkqEmYuGbrIcSgo/0uKQtBIoPLNqPKAro6BxyqIewiVsTf1aj3cJoxmff0
	Lx3yJVUss/tsRB/8msKK9WPnc1c5AjQw+D8ohE/LVTFiagUGTaBMVKe5/wc62LiDmb52aewVenUMF
	e6deXvvj+jls5jduq6AjLCR20m49KHo33Vhqs3hNFkesQ/rBeBcvR45cOIlHU9Q8lTKp0yauaZVQw
	XjF+lHeA==;
Received: from ip6-localhost ([::1]:25150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNczz-00Dj7i-HZ; Tue, 07 Sep 2021 15:26:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNczt-00Dj7Y-Ip
 for samba-technical@lists.samba.org; Tue, 07 Sep 2021 15:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ObkTc/oaZnlxmJG6K/fRnKFJNgagt9Qdzf3/ahtwGzw=; b=dX6pKQRpHW//0Pjua9a1SiVphl
 xdBhik3fWwfe7CqDhXLDIOoPH2Iu1vwHNxVzP2ih+0ptH4V81pHWSIZx9GmSiH9OGGuYHkxdVTbCT
 /vWLQ8OL/epv0qe/ZjFBYBnmfica8GXyR0RpWRW6ilS7J8V8nB3BohN/ei9naXuqW2IPySJ72Z85H
 1zO6s04oYnRJFAdwabe3BJIbzHb69KcIUZO4H9Dtm5+/ojEQTDVmtbJBK9sJpvn0D4fJ3g32iaFXZ
 f7TjWfvMeCzUOs7Wv9Emvu9dDnCKmC4fYLRmVEkzFcqXdcGQrVzQbTSwgUoISmM84kOnDrRNqeTGo
 kD22NLuzjU5G+znwhTSvIpOn3WQloEJWCa4nUlWX7CCDzJmmBNwgs5QrstaFBPMhteu7pr0OHcAyW
 s5pFOvYcZMwotzLgoVTDnJ0vSfAhlTgT3+TIKLD32TAHX/sn6cTuIW+utR5cd7BJMz/rBq2uhiqhA
 iyvCLK+Tqm68Ah6qrXTZRzLl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNczs-00554m-Gc
 for samba-technical@lists.samba.org; Tue, 07 Sep 2021 15:26:52 +0000
Message-ID: <4b1807f6215c6842b39e752f3978b1926eb16896.camel@samba.org>
Subject: Re: Suitable replacement of OpenLDAP
To: samba-technical@lists.samba.org
Date: Tue, 07 Sep 2021 16:26:52 +0100
In-Reply-To: <4B4EA55EA622814FB935316CC68B2DFC4B114E@MS-EXMB.mikservices.local>
References: <4B4EA55EA622814FB935316CC68B2DFC4B114E@MS-EXMB.mikservices.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-09-07 at 14:34 +0000, Ronge, Matthias via samba-technical
wrote:
> Dear list members,
> 
> I am turning to you today about a complex problem, perhaps you can
> give us a better understanding of what we need to do. We are
> developers in an open source community that maintains a program that
> is used to describe scans and display them online.¹ It's a web
> application. The program has a source code history of more than a
> decade. None of us have been in it since the beginning, but I've been
> in it for the longest: over eight years. There's support for LDAP in
> there.

What do you use the LDAP for ? (note: at this point I haven't read your
source code.)

>  On the one hand, this allows you to log on, but also, if the
> underlying operating system is correctly configured, a Linux user is
> created for each user and he/she has CIFS available in his home
> folder in order to upload scans. The application always creates
> symbolic links in the home folder for the processes that the user is
> currently working on. The whole thing was very cleverly thought out
> back then. But all of this was in place before my time, more than
> eight years into the past of today.
> 
> One must install Samba scheme in LDAP, and in the application, one
> must set up LDAP server, and an “LDAP group”, with many values from
> Samba scheme. We know (roughly) what we have to write in the fields
> for this to work, but none of us has a deeper understanding of what
> is behind it. Maybe not all of it makes sense or is semantically
> correct, but someone in the past noticed “oh, it works” and it has
> been used that way ever since. We are willing to learn.
> 
> My question: In one of the inquiries on Ask Ubuntu², I was told:
> 
> > you should be aware that Samba is actively working on removing
> > SMBv1,
> > this will mean that you will no longer be able to use openldap with
> > Samba. This will not happen at once, it may be a year or so, but it
> > will
> > happen, so I suggest you start planning to upgrade to Samba AD or
> > similar

Ah, that was myself and it still holds true.

> 
> We have no real idea what that means. What do we have to change about
> this web application so that CIFS drives can be made available from
> the server in the future? Here I ask you for guidance and help.

You probably do not need to change your web application code much, just
how you interact with Samba.

> 
> What does this LDAP server AD have to be?

Samba can now be run as an Active Directory Domain Controller (or AD)
and it comes with LDAP, DNS and kerberos built in.

>  Or is there anything like it?

From the sound of it, you are running Samba as an NT4-style Domain
controller, there are other solutions, freeipa for one, but this (as
far as I am aware) allow shares.

>  Why is OpenLDAP not a solution to use in the future?

You may be able to continue to use openldap, just not with Samba in the
long term.

>  Is SMBv1 the same as OpenLDAP?

No, openldap is a directory service and SMB is a windows protocol.

>  Why are you removing it?

It is not being removed, it is just SMBv1 that will, ultimately, be
removed, SMBv2 and SMBv3 will still be used. Samba has started to
deprecate a lot of the parameters that an NT4-style domain depends on
and the NT4-style domains depend on SMBv1. Smbv1 is acient and very
insecure.

> 
> If there is a simple solution to this, I'll be more than happy to use
> it. That means, for example, to do without LDAP altogether, and
> instead implement a sudo script that edits the smb.cnf file for new
> users, and everything works without LDAP, which is great, too. Just
> that we have a solution ready for the future.

Planning for the future is good, at the moment you can continue to use
your existing setup. Can you point me at the portion of your code where
you setup openldap and the schemas you are using ? That way I can
advise what needs to be modified.

Rowland





