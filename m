Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4726A6E2
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 16:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UXYWlYpvyVruVqJVp9lHu4q8AKLQmMQ5T1D3L6uTbCw=; b=nfLbgUSiMPS4UfnbLc1FQtos2d
	kOyDy1OWG3c8Kt/wV4nv8RvqGvI0lPnOIC3Ms2oKbaDn56ScRVgH/+SyMDnK/wbsL4lEAAb1RWOJD
	MAMq8xmELo03LdZcmJbttpm0zEWdSr0uXodqQf0XKmSLQXG22lg7riMrvcA/8Ejpg3W3PW9WL4l67
	IeaQilHmlvfRObvpxmk4SvlcJ7MjzJS99hnhOpyYL9lAA8C/L68ojWNzTcytsKxT/EiJPdHwVuH2Y
	oVO48adyYqCX8+X0a7xJv/afzPkbzZahBUbjmHL6t6A1dVfvtUulZvrvtsuVIEq8SrzzLiteGHt4q
	K2+04Qmg==;
Received: from localhost ([::1]:29810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIBiN-005VcM-70; Tue, 15 Sep 2020 14:13:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11760) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBiH-005VcE-CQ
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=UXYWlYpvyVruVqJVp9lHu4q8AKLQmMQ5T1D3L6uTbCw=; b=O2ekoPi50KtozXTfpdXHnbkzXj
 qt6gZ6OnbyZ60P9nzgcnNt71dvVhMjmhXocNeCPJpGhPDYt8dSsjITIfIaeNhsjRMvcTi7gziwkHf
 gJa4gEBc7eTMaKi1f+XVDMzSfwYpzjTYcrVXbHBtmapUl1u5miG6aH8hYI2Ge+E3wPSkYs+bZXb5c
 QuQ7FWXKEKoMP6unMEHnGyh28+5GqZIETWG01jakN7q8P3Bw6ZPw/I97tt6XLP/ETj6xqGEVJW97d
 BVyW1GNJDwOG6AqHdGGhBlbvLRJda0uprVbyvry06Bm2/lqAU1k+iJxI/0/zB76T3jN0c+vCG6NjK
 XiAqN6eNMuUziBsUyraZVSoI+NhK/s2na76va30kdqzZAWS+y4JpchfHRmpFLlHwcvB6Rb6Dd8klN
 /3waZX97mjq+gB2Cc1+X1+jOxJRT9fM03p7GQKxuDd+OOz/oOH5A2I+QowZYRSQq/LdgMN/hUvPd3
 RpDS1d1LuXdUj/bdrYokoa6E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIBiB-00018L-Os; Tue, 15 Sep 2020 14:13:35 +0000
Date: Tue, 15 Sep 2020 17:13:33 +0300
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: SELinux attributes in Samba domain
Message-ID: <20200915141333.GE23377@pinega.vda.li>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
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

On ti, 15 syys 2020, Mikhail Novosyolov via samba-technical wrote:
> 
> 
> 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
> >On 15/09/2020 12:08, Mikhail Novosyolov wrote:
> >>
> >> 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
> >samba-technical <samba-technical@lists.samba.org> пишет:
> >>> Your problem will come with sssd, it isn't supported by Samba
> >(because
> >>> we do not produce it and no little about it) and even Red-Hat no
> >longer
> >>> supports it use with Samba.
> >>>
> >> What is the problem to use sssd as a client to enroll into Samba AD
> >domain?
> >
> >Before Samba 4.8.0 , the smbd deamon could contact AD directly, this 
> >meant you could use sssd with Samba, instead of using winbind. From 
> >Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact 
> >winbind, it can no longer contact AD directly. You cannot install sssd 
> >and winbind together, they both have their own versions of the winbind
> >libs.
> 
> Yeah, I know that sssd has its own libwbclient.so.0, but did not study
> details. I still can't understand the initial problem. If sssd and
> wbclient conflict on the client side, samba's winbind may be turned
> off, right? What does prevent from using sssd as a client for samba
> domains?

libwbclient from SSSD is deprecated and should have been removed
(already or in upcoming releases). It should not affect any operation as
its use is not needed. For cooperative setup where both winbindd and
SSSD work together on a client, idmap_sss is what is needed in Samba
configuration.

There is no problem in running SSSD and winbindd on a client side; the
catch is what use case we are dealing with. SSSD does not support
pass-through authentication ([MS-NRPC] sec. 3.2), so it will not be able
to authenticate users from domains unreachable by the client through
Kerberos trust path link towards their domain controllers, but for all
other situations SSSD should just work fine.  Technically, it is
possible to use a direct LDAP bind account from that user domain to make
it possible for SSSD to talk to that DC (it doesn't need to be a machine
account, really), so even with this case it is possible to have a
combined setup.

Note that in this case winbindd would not be able to pick up any POSIX
attributes too because it wouldn't be able to reach the user's domain
global catalog or LDAP instance on that DC either -- using LSA
functionality it is not possible to query anything beyond basic NT token
details anyway.


> >
> >If you want to extend the schema to store selinux data, then this
> >should 
> >be possible (you just need the correct .ldif), but you would then need 
> >
> >a tool to extract them from AD.
> >
> In case of using pam_winbind, will it be sth like making an ldap query
> (using ldspsearch? or which tool will be better?) in PAM stack after
> pam_winbind, authenticating via kerberos and making a query for the
> current user name? 

No, this is not really a correct approach, in my opinion. If you really
want to expand winbindd to handle more attributes than what it has now
and allow consumers (e.g. pam_winbind) to have access to them,
you need to:

 - add retrieval of those LDAP objects/attributes to winbind modules

 - add an interface to wbclient API to be able to retrieve these
   additional user properties, regardless where they come from

 - implement logic in pam_winbind to support retrieval of additional
   user properties

 - add server-side support in Samba AD DC

 - add management of these attributes to samba-tool

-- 
/ Alexander Bokovoy

