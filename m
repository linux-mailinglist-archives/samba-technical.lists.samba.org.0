Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF33D6771
	for <lists+samba-technical@lfdr.de>; Mon, 26 Jul 2021 21:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=deZBiY20wwYJDt0iErn5wRQQ4ljagc83wscBGLG7dQY=; b=w0A16eSverL8suzKJPuSM0EQPY
	L5Z561OJJqtqiT20VLedbHRU9r0Agi2iBAQ+qWL9PztnZqhnaQtW9cIpa//7Jpr3vu5LXoe7Thd3K
	czt+vP55QO4/jjRcyreE/lxyQVQFZgRRC92k28ECoP+nC68lxlTwrYudAccuhEsbcjPyLS2TTwF/x
	JBwLstfTXUOGSiDdKT9fmVuYlIh5WKgJ6OlFucnLlSFZv4YZWQZTOy3Li+TgzZVvAVG0uPn+T3EpU
	Bj4yAU2THH74LIcERSpxg64Djq0jhoIlJOga67bUXo85EoQvWzZE2NfVbnsMoSsJlwVHdS2jwFRRj
	r0iFdacA==;
Received: from ip6-localhost ([::1]:49360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8660-000tRW-5k; Mon, 26 Jul 2021 19:17:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m865v-000tQf-Ql
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 19:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=deZBiY20wwYJDt0iErn5wRQQ4ljagc83wscBGLG7dQY=; b=R3yZxjSC/HQwnYdD+jQKHL5cD4
 lQFLmvhPpl1AjUqkVzxSBtVc7J//UGfZopC5WtduGW3KrPJjhL+zpSBj7NLd4l/Sf3q/Z4OUtqxiE
 7L4k3DalRQASFTLrbLvva4dhRR56L89nnj5JwU/86NxC/7bGA3VuRw6sCDSVISXy3uw4o5UmryAzz
 G4wQfkDrX+2H6e5Xv21sgyrv1LTU6A4MFjtgxqVf4BEpx4+rl5iscQou8gq8bkBVMggp/xaTkU/0R
 PHd7Zgy7ZPQnTBj7UX/mx2sWClnaBjgsCXlm0AH+jtP9PB5WC+lBEb7ZB8j3jD4RYdCvw5UwlFdpp
 mXAROHRES3Z9Rwo7OBWWagqDeq27zNfKA0MZ3PHYYWOregzIK3DFK5Mk7o9040pTxvJqYZsU/sY/F
 k2nsvV8owCHwCuGUsk3s6losm+XL9lD2S/knQjGuwsdYz2kotb2RhtkdzAstPp7P5XLv4RkTqmuVo
 RNrdrZfPiz6SoR/lFx1yZYQC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m865u-00008R-T8; Mon, 26 Jul 2021 19:16:55 +0000
Message-ID: <754a4adf537fa6f92b4d75d8cff8f414ea49f952.camel@samba.org>
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Andrew Bartlett <abartlet@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Mon, 26 Jul 2021 20:16:54 +0100
In-Reply-To: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2021-07-27 at 06:23 +1200, Andrew Bartlett via samba-technical
wrote:
> In our wiki:
> 
> https://wiki.samba.org/index.php/Setting_up_a_Share_Using_Windows_ACLs
> 
> there is the fairly strong suggestion to set:
> 
>  acl_xattr:ignore system acl = yes
> 
> I feel like this is a fairly bad idea, we should defer to the kernel
> unless we really know that just doesn't work.
> 
> But I don't fileserver every day, so I wanted to ask first.
> 
> What is the broader view on this option?
> 
> Andrew Bartlett
> 

I added it to the wiki because Louis recommends it (a lot) and after a
thread on the mailing list (if I remember correctly), also Andrew
hasn't given the full context:

If you are setting the shares permissions from Windows (recommended),
you should add this line to your share:

acl_xattr:ignore system acl = yes

This will make Samba ignore the system ACL's (ugo). 

I also do not see where the kernel comes in here, as in 'man
vfs_acl_xattr' it says:

acl_xattr:ignore system acls = [yes|no]
   When set to yes, a best effort mapping from/to the POSIX ACL layer
   will not be done by this module. The default is no, which means
   that Samba keeps setting and evaluating both the system ACLs and
   the NT ACLs. This is better if you need your system ACLs be set for
   local or NFS file access, too. If you only access the data via
   Samba you might set this to yes to achieve better NT ACL
   compatibility.

To me, that means with 'acl_xattr:ignore system acls = yes' set, the
normal Unix 'ugo' permissions are not changed, so where does the kernel
come in ?

Rowland



