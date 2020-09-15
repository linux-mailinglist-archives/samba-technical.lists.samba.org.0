Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20526A793
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 16:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=PPkjme01cdUA3qMAVC+vEM1LeImU7FUGae6H1Yb2i6g=; b=coxi5sLsLd47fddrcnZlQsoR1E
	ppHFYgfRQhIrmJ2kI8cQakj1ZnW6va/RVKmQ1o63xygO1tKyP7vANFGuSzIw22Yhvi2GlAoYE69/9
	kKc3daQ/QLpXPH6U1Dloo2ORGQa9QiMWM6UeCZhk1nIX3Fi01iUEk4nMwC4XvRnepLqG3MM9rZDYt
	X38PVj3KS6tvOS6Em+UYh5p75U8FVyoxRs2wrZz8W14X9oDvSjuIBbiY52lnHVP5XMyy/QjfEJ/ja
	IMFFqfvXrdKkFHr4IX8epC09Qua+bfi/z/C+7PMMOvbUospaqsnXyKG3BrOpF6fI2zIWurq4qP0QZ
	Tuq1Ls4w==;
Received: from localhost ([::1]:32186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kICKF-005VyD-Bg; Tue, 15 Sep 2020 14:52:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICK9-005Vy6-JI
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=PPkjme01cdUA3qMAVC+vEM1LeImU7FUGae6H1Yb2i6g=; b=29cEl2A9EdjU+7urpGM3CLx0KM
 RsMX0hssjGG9U+NfNw/WTubN6L5DVZdYL8808gerSvBbR9JMuZc+x89fc3cwaeRLBbKEd4w86TwfU
 XxK3lmykbNWWWzZeXFNgRNTdovMJWEK/ydXk8zBPT8xJK9buucMtvxg0/mAOtNkXzD6uX4JGi9QJo
 r7q2N3rIZleAWHEB0OxBPsIii1IoC2CSpNb6fxSxxPUMWN2k2lJXJP7Of/uOIc3WlZoGbNQs2cO5y
 uzu/DQJnoMnxGeDbHHn4ut1nqFJOkt9R9L+jLfXgIRjoMnJAN7hFvFPEffGRROhaH6NXGvIahDyZs
 p0aIRGQzWFPsz3nSTLpbFQgmiNFJVT390RKP8P719DHMUOTLhLHRI/lriqHQX8pR49gz0Yb0sOi/F
 6JuipS2+NlV+8VOD564Eq1c+jt661w6IrzFFQ5RC8PF/O99WS8wpkJGVRzAWDGchZahKgPO4qTrR1
 DoGysR/7ACgTLNQp/vk4Du5f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kICK8-0001UX-Sn; Tue, 15 Sep 2020 14:52:49 +0000
Date: Tue, 15 Sep 2020 17:52:47 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: SELinux attributes in Samba domain
Message-ID: <20200915145247.GF23377@pinega.vda.li>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
 <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
 <b2911d7d-54df-896c-9569-eebba6b0cb33@samba.org>
 <10542C0C-2DEC-47CB-AF65-3717A3077868@rosalinux.ru>
 <390168ab-7835-5750-cfca-3327596618b3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <390168ab-7835-5750-cfca-3327596618b3@samba.org>
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
> On 15/09/2020 14:38, Mikhail Novosyolov wrote:
> > 
> > 15 сентября 2020 г. 14:50:52 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists.samba.org> пишет:
> > > On 15/09/2020 12:08, Mikhail Novosyolov wrote:
> > > > 15 сентября 2020 г. 10:10:32 GMT+03:00, Rowland penny via
> > > samba-technical <samba-technical@lists.samba.org> пишет:
> > > > > Your problem will come with sssd, it isn't supported by Samba
> > > (because
> > > > > we do not produce it and no little about it) and even Red-Hat no
> > > longer
> > > > > supports it use with Samba.
> > > > > 
> > > > What is the problem to use sssd as a client to enroll into Samba AD
> > > domain?
> > > 
> > > Before Samba 4.8.0 , the smbd deamon could contact AD directly, this
> > > meant you could use sssd with Samba, instead of using winbind. From
> > > Samba 4.8.0, if 'security = ADS' is set in smb.conf, smbd must contact
> > > winbind, it can no longer contact AD directly. You cannot install sssd
> > > and winbind together, they both have their own versions of the winbind
> > > libs.
> > Yeah, I know that sssd has its own libwbclient.so.0, but did not study details. I still can't understand the initial problem. If sssd and wbclient conflict on the client side, samba's winbind may be turned off, right? What does prevent from using sssd as a client for samba domains?
> > 
> > > If you want to extend the schema to store selinux data, then this
> > > should
> > > be possible (you just need the correct .ldif), but you would then need
> > > 
> > > a tool to extract them from AD.
> > > 
> > In case of using pam_winbind, will it be sth like making an ldap query (using ldspsearch? or which tool will be better?) in PAM stack after pam_winbind, authenticating via kerberos and making a query for the current user name?
> > 
> From here: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/assembly_using-samba-as-a-server_deploying-different-types-of-servers
> 
> There is this:
> 
> Important
> 
> Red Hat only supports running Samba as a server with the |winbindd| service
> to provide domain users and groups to the local system. Due to certain
> limitations, such as missing Windows access control list (ACL) support and
> NT LAN Manager (NTLM) fallback, SSSD is not supported.
> 
> I do not care if anyone says you can use sssd, the Red-Hat documentation
> says otherwise and they should know , they produce sssd.
> 
> Do not think that you can use sssd on a Linux client, because as soon as you
> add one share, it turns into a server as well, or should we just tell
> everyone not to use Samba as a server ??

It depends on a use case, as always. Running Samba server on a client
enrolled into RHEL IdM (FreeIPA) is supported as a technology preview.
This might give you some idea of a direction where supported
configurations are moving.

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_identity_management/setting-up-samba-on-an-idm-domain-member_configuring-and-managing-idm

Rowland, I think you are overly complicating the situation.  There is a
certain amount of work to do, sure, and we are discussing what is ought
to be done to get that working. There is no need to critically
force-reject anyone attempting to improve our options.


-- 
/ Alexander Bokovoy

