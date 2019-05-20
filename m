Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73B233CC
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 14:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6ytvJlkt8047nZRPmtlwiLyiJ5D8GfIP2ONA469TyiA=; b=bB3B8vzHOr9x9g4MfowTKhTg9X
	oc7nIx4L2P/w13axbhvLl6YDaaytjPL062JlNG9bD+pDyKYYqMkpAH4IKyX9ThXt9zFKJqhw7fvQZ
	MLxLQiA3lms+WE7HYuuLBb3Hd6uqE3dE8VkoZbV1xg2zu04ofRJ4E1bc9LcOsjY58qg3Rhz87PjgU
	3nigXJUB88zxvVSCUOZGQqnN/d1VfuBcjU9Mtre0a0qUOBC4DbWRsbH9AO0GPxq2fp/miw7zs0FYO
	bRgjn6NFi0xtI4edwldT6B8bXCguRCLAQ+CTdu1+FfGd2J4zWdFoxAI+kGqmfJS+HscPYfUvPxHS/
	Wrp32LIw==;
Received: from localhost ([::1]:37704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hShas-000flZ-CB; Mon, 20 May 2019 12:40:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:45580) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hShan-000flS-QG
 for samba-technical@lists.samba.org; Mon, 20 May 2019 12:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=6ytvJlkt8047nZRPmtlwiLyiJ5D8GfIP2ONA469TyiA=; b=siR587qlDvOn0vrU+PQHfmuktw
 B4MTpZAUvgSqRe1i4FbNamtTp0hBXR5VTVH4HE8m16b+A1JfwNugO4kbQSGOXXkGF1Psyr+SYAqzr
 F04hCud2Fpv62ONW5LhdbxK2AbvKdPBUfpfBY4l3B8yaQuNGx/9I+aEN4FZBRXOTUdfA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hShan-0008W2-D5; Mon, 20 May 2019 12:40:37 +0000
Date: Mon, 20 May 2019 14:40:36 +0200
To: Patrik Lundquist <patrik.lundquist@gmail.com>
Subject: Re: Btrfs remote reflink with Samba
Message-ID: <20190520144036.7295329f@samba.org>
In-Reply-To: <CAA7pwKPZrwKcpPRvvuhgqxZk6KzC871Pa0gusTCa6oz=W=fqGw@mail.gmail.com>
References: <clzY4RoSOURzgBtua3TjQ4WXJzgY3EwTyiaYwt49zFAPIi_jO2nAQ8O2saTwpqHH9x0ISw9AVbWOvVR4hFDIx8_dzlWKAzHwcOtEuwaXzJ8=@protonmail.com>
 <275f7add-382c-bf6d-4cf8-f9823cf55daf@gmail.com>
 <CAA7pwKM_1uWbu9ECgkqAMXMWTOJm5xH1wvHKFwq+7w=JeQQ7xg@mail.gmail.com>
 <ZBp4TxX3BVubLSjbbtXjztW20HT6YFrXCMMV6IX3xamgZbnpU4KJvO5vs0tcF5po8Ay4KdgGyffZ2DHitm4X4Hm0CFMPCjC2g_HHS9CR51M=@protonmail.com>
 <56ee6d38-d4a8-a62b-4e0d-7568030cdcad@gmail.com>
 <CAA7pwKPZrwKcpPRvvuhgqxZk6KzC871Pa0gusTCa6oz=W=fqGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andrei Borzenkov <arvidjaar@gmail.com>,
 Newbugreport <newbugreport@protonmail.com>,
 "Austin S. Hemmelgarn" <ahferroin7@gmail.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 20 May 2019 14:14:48 +0200, Patrik Lundquist wrote:

> On Mon, 20 May 2019 at 13:58, Austin S. Hemmelgarn <ahferroin7@gmail.com> wrote:
> >
> > On 2019-05-20 07:15, Newbugreport wrote:  
> > > Patrik, thank you. I've enabled the SAMBA module, which may help in the future. Does the GUI file manager (i.e. Nautilus) need special support?  
> > It shouldn't (Windows' default file manager doesn't, and most stuff on
> > Linux uses Samba so it shouldn't either, not sure about macOS though).  
> 
> The client side needs support for FSCTL_SRV_COPYCHUNK. Nautilus uses
> gvfsd-smb which in turn uses the Samba libs, but I have no idea if it
> works. Maybe David Disseldorp knows?

libsmbclient copychunk functionality was added via:
https://git.samba.org/?p=samba.git;a=commit;h=f73bcf4934be
IIRC, it was added with the intention of being used by Nautilus.
That said, I've not tried it myself, and I don't see any reference to
splice in:
https://gitlab.gnome.org/GNOME/gvfs/blob/master/daemon/gvfsbackendsmb.c
(Perhaps I'm looking in the wrong place?).

Cheers, David

