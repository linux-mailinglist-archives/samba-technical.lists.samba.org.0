Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF8A71B5
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 19:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YWVq5mzct/8EUBAfN02AMIfCb7IfcgPFOxCd6hiMT4k=; b=idRc4oJbpcig3AFP+zXmotyyrK
	R21b0Nh1qQChhuPiV3QkancC69DZr+8DKj454EqHA6/PDP+b0Z/XhJfvbBQlJ8ZnfPiSpRiFDBkKP
	XptkbiDDwdJ1Pf4QxPYIgEh36/8s8YVII7tdKmoyRCqeVJBHKYs4lpZup6UNDKkf1maQ13aPLFkKU
	kfpHF7R1d/sUtsRBg9Wqp6IWnD4k5NakFcSaaqKXXG6MQ/UEMIacHVxcfHEA+BDOkdl26wgWG+91D
	JLEVpoLmGlJf5t2yn/NmSd2BD2KrEmqy8F+M3orECD14TJVw8fIQ6Zh3ax8dioDyM9SJGbDCDLWtf
	cB30VVKg==;
Received: from localhost ([::1]:58356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Cej-003Eoi-Pf; Tue, 03 Sep 2019 17:31:49 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:43294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Cef-003Eob-3i
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 17:31:47 +0000
Received: by mail-io1-xd2d.google.com with SMTP id u185so33954135iod.10
 for <samba-technical@lists.samba.org>; Tue, 03 Sep 2019 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPbIouzbi4pXBChXnojcl6IiUx26+/WRcA7NAPJ+Y8I=;
 b=BLsUxHHc+LBtZH0+ScKCmRnIkXZqrHxLx2Btu5hYA2URtkVyAZ8VHVO49i+awBpyrB
 +rAft30VsTDrpR0nAe5lpobZDrzohl+CJUxEw6byLrDxLH16OJhp6bxsGDynGX/NP7w+
 vvYtiNwBAgvLUsPOzoK9pyiH1aXBqGtBAxyZoXRBm+s5MEUTfMNor+hhruyI3P+69jlQ
 IbaZXPWoc5mHXo7RTG5nLjp8xWwfam/1Sl0xvDCsGd9ro+ZIUOxxfR0i6dvO2rGbIivP
 8Wyhw5bG4hpksylWQr/6+H9godAO5ykvqwsOhKJyqtVwiNZDNP8duDWNAkqd/qkQ8jkG
 ohDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPbIouzbi4pXBChXnojcl6IiUx26+/WRcA7NAPJ+Y8I=;
 b=hUm4+Q64wJ1989k6K3igZl6MbCiXgve4/RYMY7W7FH74sEEG1OVRiyHsHSe81GRbIs
 fYlDeDTku1zQgwZUKqTd9dEO1QnLRC0k3TD0Wn2xeusg5CedrRMwMwKUG7xgp8dkVEyI
 CcltrzdqSHqNDZENrR6Uq7QxbFtrd9l2tuR4u6mIXzt9sMdlTpfrzR96YgDwVq12I+bm
 bMO+Pt0D0NtQpAPnuVs9SvxqXzTQv3+2Llsvg6RNnAFzNKSPWY61WqYDVL6LdZMcIRXq
 q48d0jyadIq5oMj3jZz+3KeG35ZxTDOergcI9HuLCNnttRe5EiEuA5UYhIfDzbWr68oi
 NhZQ==
X-Gm-Message-State: APjAAAXXXf3CEinstlEHQ53R9BNOwEboxZCUhatsWyt8Y55+f3MEFhVK
 y+892Qb56hWqfwpLJafOA2HGz8JRecnZ2K76C+O6nQ==
X-Google-Smtp-Source: APXvYqzP6MpEmu3e5XeXh1Qw2MJH7OYi3eI+GY8bcK9OMOm8WZPWhEQponcy2yyvE7nhVUBSmmZZodIpOSO4EwnXc3U=
X-Received: by 2002:a02:81ca:: with SMTP id r10mr4530193jag.62.1567531902740; 
 Tue, 03 Sep 2019 10:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALmqtCXzTfqrOX_rSoR5nbEqGvcO1Xeuk7a+56+uoC0nh_-Kmg@mail.gmail.com>
 <20190827235014.GB219881@jra4>
In-Reply-To: <20190827235014.GB219881@jra4>
Date: Tue, 3 Sep 2019 23:01:33 +0530
Message-ID: <CALmqtCU-NfivpVAdSz74TP5MX=8o514i0CyvUNixG6Yax06j-Q@mail.gmail.com>
Subject: Re: Query about slow read performance
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Abhidnya Joshi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Abhidnya Joshi <abhidnyachirmule@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

Thanks for your reply. Yes we do see less number of credits being asked by
problematic client compared to the other Win2k8 client.
Is there any way to increase the number of credits client can ask for
irrespective of tcp level delays/sizes in Win2k8?

Thanks
Abhidnya

On Wed, Aug 28, 2019 at 5:20 AM Jeremy Allison <jra@samba.org> wrote:

> On Fri, Aug 23, 2019 at 12:24:34PM +0530, Abhidnya Joshi via
> samba-technical wrote:
> > Hi All,
> >
> > Recently while doing single file read testing on SMB2 from our product to
> > Win2008 (as client), we saw some performance degradation.
> >
> > Although we are finding out causes in our SMB server, we can somehow see
> > this degradation when the Win2008 got security patch applied.
> >
> > *2019-03 Servicing Stack Update for Windows Server 2008 R2 for x64-based
> > Systems (KB4490628)*
> >
> > The performance drop is not observed for write but only for reads and the
> > cap seen is around 260-280 Mbps. (Earlier it was around 520 Mbps). The
> > security patch does not have anything directly related to I/O or SMB but
> > this is what we are observing.
> >
> > My question here is, has anyone observed any of such problem recently
> with
> > Win2k8 used as client?
>
> Nope, this is the first I've heard of it. Can you do a comparative
> wireshark trace between an unpatched client and a patched client
> to look at the differences in how they're driving the server.
>
> Any credit changes ?
>
