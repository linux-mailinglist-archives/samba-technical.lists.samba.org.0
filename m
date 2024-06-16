Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B7909C0C
	for <lists+samba-technical@lfdr.de>; Sun, 16 Jun 2024 09:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wBHRxZXg0yLC/DXn1sBuZ8sTCKdH8RviJdnsk5SCPko=; b=j1IesOvavPXP8aS751iF5W0C5d
	KH4DUFsDQ+rDjCdouBisHbpx6HZ6O9ngzTzciTWPYLhk4y/M0g3tnmgSY76PyEQePOWhwMl60w7C8
	DgjZUo8x9mAwyIL46lLy1ebDv5LuAuj6VwvxmdOm1zEtBHYN1Zz7WNETWt0/pD8Bf6rD8PGOc0LEy
	8DU/E+cwbN6laxJKc+SVx/+TEJNlOy8hV5CuCuFm7f2non4hQiuxgfQDaPjonmSk6ATxPGlQ18XkE
	3P03lp1KEsi3W+vsSZNQu1c1V1uRcmmmfGL7T2pkoj1E4hqP9n9MrmRlA6fxTYcpSQCmu89S2qkzw
	Ev/+977Q==;
Received: from ip6-localhost ([::1]:56194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sIkBA-00E12H-0c; Sun, 16 Jun 2024 07:19:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35978) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sIkB3-00E12A-2C
 for samba-technical@lists.samba.org; Sun, 16 Jun 2024 07:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=wBHRxZXg0yLC/DXn1sBuZ8sTCKdH8RviJdnsk5SCPko=; b=248KLkDb9tBaUyFw1PsAJAg40Y
 kTGY88xv/xpNnJBEigN+sMvaziIb0kUXOn7KuUUmC86eWqLUSVCIdZAXjJfuve8xbVy++0OemVvLK
 2BHQW6qQ788dUp0LXV5BLdjj5FISCTRvcH1QZFWxlZobj1sWduPrTYwhPfcOYENSvnePfgFETWo9v
 EChA8xSyGzxtiqBCfSg1iNbUzWNpWRA/j7jH9Ebbo3LcGVxj80DG7Gc16xszUz5kFV0JZaNTj8igM
 x1Km4IGzIhAMfQhAHdpbmySvCGgQjd8MYESPGExEspTpVn03z9vPOmj0xeB1y+fMir4J4cHTKXCkK
 mtac7sMDBt+bpalfxvp7Wxe2IJrzKAenX8SGJxmWJoFmN+78gDYOc4V1rK7kbGg3e5GEnEgJrz5mg
 dXq0AHWUOiSncPrRGZn9h/XVsP5HOiDn4kGmaU94kNflnlO9bYxYbGSb5cZ8hYCQIwsxtJpDZNngj
 gFzUCeswVbplQCQC4tkgKF4g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sIkB2-00GznT-1G; Sun, 16 Jun 2024 07:19:48 +0000
Message-ID: <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
Date: Sun, 16 Jun 2024 09:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: sprabhu@redhat.com, samba-technical@lists.samba.org
References: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
Content-Language: en-US, de-DE
In-Reply-To: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Sachin,

> At the same time, I can also see that getuid()/getgid() returns 0/0 and
> geteuid()/getegid() also returns 0/0. Does the default plugin use
> uid/gid 0/0 while performing this operation?
> 
> I have the following questions
> 1) What are we testing for with this smbtorture test?
> 2) Is the anonymous user allowed to modify the DACL of the file as done
> in the test? This would obviously lead to access denied errors as we
> see currently.

It checks the reauthentication has no effect on open file handles
only on new file handles. After the SMB2 Create only fsp->access_mask
matters for access checking.

> 3) What uid/gid should be set when performing this action as the
> anonymous user?

Maybe you need to remember the low level token at open time
and use that.

I guess the result of vfs_ceph_igetf and vfs_ceph_userperm_new
should be remembered in an fsp extension in vfs_ceph_openat.
Otherwise it doesn't simulate a kernel file descriptor.

metze

