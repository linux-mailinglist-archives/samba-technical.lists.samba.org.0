Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822426A81A
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 17:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=S+jxDBw/Hxe+yqdm5xGuwnPCNQKR0zhYP5UYxzg9KIM=; b=Hp4KmffnHOj6yYuynHUZwA2EXF
	wAdnPaleEpLsyvHCemCPBp8aMdyCqoJ3nOe0RYq3UfNHyu9vpQiRff6DwkhlJIDztMyY716ix/HSr
	zpHE1H045CTaUWY0j50CnOjJw5Cufkg1A6L2IkPMvaxOgbIvbms+XC+A330p4XKfjCELz5w8ljhr1
	d3dCsi4/VJFshzaNZg7s09vhYBbkmyuWu4kCq7uWZsF3Aaj4Ij2+Q06M2DRPYWtpMoQMIPqmS5e7a
	NrMwW5jmaTy9kAHuqt1JdPu4EpvPGyfwuYef7Vl/aLl1H8OWDnRNgl/xExyH3NaxORSzCwSyN73qY
	OK4fbK1Q==;
Received: from localhost ([::1]:32928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kICSC-005W5A-Co; Tue, 15 Sep 2020 15:01:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICS8-005W53-I1
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 15:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=S+jxDBw/Hxe+yqdm5xGuwnPCNQKR0zhYP5UYxzg9KIM=; b=aneYg5X20j/mMN/112l99HoCf4
 IM9qM1SMhOAx3LDrDOX6U4iZkzElvIpHswdZGZ2k+Xzu+exHfRqZRPnGIPXGmCb/PIX1I4ZlDGmoO
 D4BIK8f+XT7480il7q58i86avG+b085oPx4UJgZUhIgzdfmVzPHpJdHIbojMMzKm/aXQka5oJ3KAh
 R9ej/rVTOZrLrazqwQbA4ouQzbb993uWVvyn0cZ6NLAzjOb1Vdt4MgeZF2TS2aXJHRUOqga/70K4q
 y73Xi+3NLB9ZSGbuI+ezU80shKHgzSqPpPybi3wcDl13+1AEBj1OvcIdS3mBnyWqXgtZGhce5lNM/
 kODqCSDAWvOLRm5Tucu7tGS0oXVs6du57B/0JYFBWpxM2lsAXPnRbEnXCdphDduFKm69QeG03CGgF
 4VZ71a0kakTfIC/9z7nBqHZwzovqxeKgvZKJnn2BnDMpNiN/nxa3f6CYqYvfyj4h0vXHQYAWXVter
 3d96kqQOS5tQdUQWEyFzcUH7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICS7-0001a5-Vt; Tue, 15 Sep 2020 15:01:04 +0000
Date: Tue, 15 Sep 2020 18:01:02 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: SELinux attributes in Samba domain
Message-ID: <20200915150102.GG23377@pinega.vda.li>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
 <20200915141333.GE23377@pinega.vda.li>
 <162cf830-3de6-bed3-d424-99f90ad074aa@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162cf830-3de6-bed3-d424-99f90ad074aa@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 15 syys 2020, Rowland penny via samba-technical wrote:
> On 15/09/2020 15:13, Alexander Bokovoy wrote:
> > On ti, 15 syys 2020, Mikhail Novosyolov via samba-technical wrote:
> > > 
> > > 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
> > > > On 15/09/2020 12:08, Mikhail Novosyolov wrote:
> > > > > 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
> > > > samba-technical <samba-technical@lists.samba.org> пишет:
> > > > > > Your problem will come with sssd, it isn't supported by Samba
> > > > (because
> > > > > > we do not produce it and no little about it) and even Red-Hat no
> > > > longer
> > > > > > supports it use with Samba.
> > > > > > 
> > > > > What is the problem to use sssd as a client to enroll into Samba AD
> > > > domain?
> > > > 
> > > > Before Samba 4.8.0 , the smbd deamon could contact AD directly, this
> > > > meant you could use sssd with Samba, instead of using winbind. From
> > > > Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact
> > > > winbind, it can no longer contact AD directly. You cannot install sssd
> > > > and winbind together, they both have their own versions of the winbind
> > > > libs.
> > > Yeah, I know that sssd has its own libwbclient.so.0, but did not study
> > > details. I still can't understand the initial problem. If sssd and
> > > wbclient conflict on the client side, samba's winbind may be turned
> > > off, right? What does prevent from using sssd as a client for samba
> > > domains?
> > libwbclient from SSSD is deprecated and should have been removed
> > (already or in upcoming releases). It should not affect any operation as
> > its use is not needed. For cooperative setup where both winbindd and
> > SSSD work together on a client, idmap_sss is what is needed in Samba
> > configuration.
> > 
> > There is no problem in running SSSD and winbindd on a client side; the
> > catch is what use case we are dealing with. SSSD does not support
> > pass-through authentication ([MS-NRPC] sec. 3.2), so it will not be able
> > to authenticate users from domains unreachable by the client through
> > Kerberos trust path link towards their domain controllers, but for all
> > other situations SSSD should just work fine.  Technically, it is
> > possible to use a direct LDAP bind account from that user domain to make
> > it possible for SSSD to talk to that DC (it doesn't need to be a machine
> > account, really), so even with this case it is possible to have a
> > combined setup.
> > 
> > Note that in this case winbindd would not be able to pick up any POSIX
> > attributes too because it wouldn't be able to reach the user's domain
> > global catalog or LDAP instance on that DC either -- using LSA
> > functionality it is not possible to query anything beyond basic NT token
> > details anyway.
> 
> Thanks for backing up what I am saying, if you use sssd with Samba it isn't
> as good as using winbind, so do not bother.
> 
> Before anyone accuses me of hating sssd, I don't, I just do not see the
> point of using it with Samba, winbind does more. I used to use sssd until I
> realised that I only needed to setup one conf file to get the same data.

winbind does not support smartcard authentication and certificate
mapping, it does not support multi-factor authentication either. As
discussed in this thread, SELinux context enforcements delivery is
another feature that is not existing in pam_windbind. Same with sudo
rules. These (and many others) features of SSSD are important enough to
a wide variety of users to use SSSD instead of going with other stacks
(which do not include winbind either).

I love that we have favorite topics to argue about but a single use case
cannot define alone what you should be requiring all other users to do.
If we can get improvements on par in various open source components, we
are at better state than just rejecting a need for those improvements.
After all, Mikhail is asking what to do to contribute the support for
a centralized SELinux context delivery, not asking us to implement it.

-- 
/ Alexander Bokovoy

