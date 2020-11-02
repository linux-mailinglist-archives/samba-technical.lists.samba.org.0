Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6EE2A3033
	for <lists+samba-technical@lfdr.de>; Mon,  2 Nov 2020 17:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pn2neqGnuibqfN8uB/kW1G6YeQnjjq4tjKczCDdBnrE=; b=lS+07/7Doo8IXuAanac2Qbequl
	+Oijmi9UrKgzFMW8oGLmWf08IS7aFVDWZSKf7xLVu6VZ8DOkRFzxxAK2pYXQ9CeZosfJVgwgCgo7v
	X3RyOWLUGfUYnF1+hxdv47PRdJgYQ9E+SgrhKW8PGllRXnzszs7FCvWQTRVdZ808KByhXpZxbA4jh
	hFTvUMRHmdbYu0a/HFS29+4BgtmaQuDonkDqqBFEkTOw2121ZpXnfaOtiACjsZ0xUFxG+i8R0gw8u
	RrINVRfAAA07Bvd8iuHiws5Ky2JVF2Dbm7DBJoDeb6sB/rY1uE0JNXYMImHJsJ2Xg3QreoMqBIe/E
	Eexm+LvA==;
Received: from ip6-localhost ([::1]:59422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kZcxk-00H0CR-CH; Mon, 02 Nov 2020 16:45:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34244) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kZcxZ-00H0CK-JA
 for samba-technical@lists.samba.org; Mon, 02 Nov 2020 16:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604335529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pn2neqGnuibqfN8uB/kW1G6YeQnjjq4tjKczCDdBnrE=;
 b=BkBNhhubbE3/Kxyu5y5TYrcv4KhO9GYjO1lqalPkOjRRqjMEyp5eODqz7ATp1pVOHRD4Ci
 6CygS/cNEsIT6PU3eYRWYyO4HpqhCog0EXWDR76oeu6/acUaHmVYBp9YRKRaJU3ydCs8ra
 /c4FIxHpEpl8MNLinxVHsnvVvGDB4oU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604335529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pn2neqGnuibqfN8uB/kW1G6YeQnjjq4tjKczCDdBnrE=;
 b=BkBNhhubbE3/Kxyu5y5TYrcv4KhO9GYjO1lqalPkOjRRqjMEyp5eODqz7ATp1pVOHRD4Ci
 6CygS/cNEsIT6PU3eYRWYyO4HpqhCog0EXWDR76oeu6/acUaHmVYBp9YRKRaJU3ydCs8ra
 /c4FIxHpEpl8MNLinxVHsnvVvGDB4oU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-uFpY63vwNMqtNIVRHq8bXA-1; Mon, 02 Nov 2020 11:45:23 -0500
X-MC-Unique: uFpY63vwNMqtNIVRHq8bXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726AC802B76;
 Mon,  2 Nov 2020 16:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 436F25B4A1;
 Mon,  2 Nov 2020 16:45:22 +0000 (UTC)
Received: from zmail23.collab.prod.int.phx2.redhat.com
 (zmail23.collab.prod.int.phx2.redhat.com [10.5.83.28])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E31D018199CD;
 Mon,  2 Nov 2020 16:45:21 +0000 (UTC)
Date: Mon, 2 Nov 2020 11:45:21 -0500 (EST)
To: Steve French <smfrench@gmail.com>
Message-ID: <259426271.55930473.1604335521173.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAH2r5mtbe-D5Cf-qHWWnUhdYaOYtniHcf91ZFXAB6MPV3Znj7Q@mail.gmail.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <CAH2r5mtbe-D5Cf-qHWWnUhdYaOYtniHcf91ZFXAB6MPV3Znj7Q@mail.gmail.com>
Subject: Re: can't start smbd after install samba posix branch
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.20]
Thread-Topic: can't start smbd after install samba posix branch
Thread-Index: tppUJiitWMGYLgbU/93SjgbMWs9+Ig==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xifeng@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
From: Xiaoli Feng via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xiaoli Feng <xifeng@redhat.com>
Cc: samba-technical <samba-technical@lists.samba.org>, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

----- Original Message -----
> From: "Steve French via samba-technical" <samba-technical@lists.samba.org>
> To: "Xiaoli Feng" <xifeng@redhat.com>
> Cc: "samba-technical" <samba-technical@lists.samba.org>, belle@samba.org
> Sent: Saturday, October 31, 2020 12:29:55 AM
> Subject: Re: can't start smbd after install samba posix branch
> 
> Looks like you are missing a required smb.conf parameter
> 
>               smb2 unix extensions = yes

Thanks Steve. This fix my problem.

> 
> On Fri, Oct 30, 2020 at 2:57 AM Xiaoli Feng via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Hi,
> >
> > ----- Original Message -----
> > > From: "Ralph Boehme via samba-technical"
> > > <samba-technical@lists.samba.org>
> > > To: "Xiaoli Feng" <xifeng@redhat.com>, "ronnie sahlberg"
> > > <ronniesahlberg@gmail.com>
> > > Cc: samba-technical@lists.samba.org, belle@samba.org
> > > Sent: Friday, October 30, 2020 2:30:16 PM
> > > Subject: Re: can't start smbd after install samba posix branch
> > >
> > > Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> > > > There isn't error log output. Just know the exit code is 1.
> > > >
> > > > # smbd -D -d 10
> > > try
> > >
> > > # smbd -iF -d 10
> >
> > Thanks. Now from log, I know the config file patch is changed to
> > /usr/etc/samba/smb.conf.
> > Create it. Then smbd can start. But mount option posix is still
> > unsupported.
> >
> > # mount //localhost/cifs ~/cifs -o
> > user=root,password=redhat,posix,vers=3.1.1
> > mount error(95): Operation not supported
> >
> > [81490.590281] CIFS VFS: Server does not support mounting with posix
> > SMB3.11 extensions.
> >
> > smb.conf:
> > [global]
> > server max protocol = SMB3_11
> > unix extensions = yes
> > [cifs]
> > path=/mnt/cifs
> > writeable=yes
> >
> > >
> > > -slow
> > >
> > > --
> > > Ralph Boehme, Samba Team                https://samba.org/
> > > Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> > > GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
> > >
> > >
> >
> >
> 
> 
> --
> Thanks,
> 
> Steve
> 
> 


