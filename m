Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B9DE063
	for <lists+samba-technical@lfdr.de>; Sun, 20 Oct 2019 22:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=o81R4pdhd7FqvxgBXhjzNJ/WU4g5VtK1ieU1qFafjEA=; b=XxDcfBJF8La4inSD81Lop+hqQy
	NKWW60ZPBINpCiExPmQINuov8gYM3jRSJydhR6Rt2TRuqZ1/23fwcuvS3pMNNqGpSqmXQ9bz5dJ+Y
	BeMga7Fw3vDwrJl8Fi7mtcY1nwh1YAKHQLbNZR9C6frER3v/PVMUv/6wVKI2Fn3buWJ5LD/Ace6XT
	3RvSlStG4/zb5LceULTcqy6iEZYU16ypgl8Hu/WXqogTlnaFCL7AMSxUiOb2uaYD59fNs5FWyZHQc
	h6YL/4dwzqqPjB3ThokowT+odZycwyDSxXLtQ7L/83+HJRfQr6qi/ec2Rri3gGit6M5qX6G+zwN9z
	oOZIMC8A==;
Received: from localhost ([::1]:33750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMHiI-000uuQ-IS; Sun, 20 Oct 2019 20:22:06 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:34554) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMHiD-000uuI-UB
 for samba-technical@lists.samba.org; Sun, 20 Oct 2019 20:22:04 +0000
Received: by mail-ua1-x936.google.com with SMTP id q11so3222119uao.1
 for <samba-technical@lists.samba.org>; Sun, 20 Oct 2019 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o81R4pdhd7FqvxgBXhjzNJ/WU4g5VtK1ieU1qFafjEA=;
 b=H7eAjsro4JdW8qTqBedtfCGjCsTOSo0Ahq96MzUrxeFTLhQabzbGIXZocLH5WAn1z1
 dsYzP4MsHqYmPgCwb4xf9sYw4b4aZ6a6TGJ/v2tR05Ra6jzz2cCTQ8oVRhCVgysOruq2
 TrqW0TLx3NNLTrDztwE/39+beMK+y6gmrsrjLjpDSOTYEVD16DgmhDsRw5SpbSf1O+2U
 5vQedM+k6pX2ICjqDztj+hVMHyTLDJKz93G1Wt2zWsAbiHSnmjINA68sn9diGLJjr2RD
 58ZzSyzgrV97ZtmWRJwwnUnTyIXLUXUYfp4dibBpCMoe0Yw0MdaW/gdAI5m/sKgDPEmQ
 yUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o81R4pdhd7FqvxgBXhjzNJ/WU4g5VtK1ieU1qFafjEA=;
 b=jMowNu9pJphjuqh45Td5nqmeuXBvlTl77ftD2QLX8fHgKuDw6ViIuYtHo6fH5dT12Y
 MRCWyScVdTO2VkPqzy2OcegTwdIGvgcn+ZH7bHVcHVZ3GCaWXGnnLxSWdKWFyiw0DJLc
 ZNgDglSHZHsL8d0jCUmcXaXCMxZPC/T2+DJSQz03JIQqyShurF4MJgjx6lpi0X+qEy1n
 fhPwPhw55ebXV5gp+ud+FM9Vz8ShSGN27VwwlmEW5DSK+97+BEzlQOc9a9hzu/Ze0T8T
 MX4TwJbRv+ShnVVKa+9ZqrUuEZgNJw0WPpoYNBuR//pMh1G61vzjb9P/gZybxt7GIXYa
 /GFQ==
X-Gm-Message-State: APjAAAUzHkqDGOZjemacUC8vpmgE6wxxEZ/yT20qZuVcRp3mqUALzp53
 Z2VyvNTxGFhUe7VNFeYnQLU1E412yd5dpDzV8Ak=
X-Google-Smtp-Source: APXvYqziodcmc+1+scAIixGBYBrbCBgBDIuvt6Bl3k90+n6VxWEmPlVqjPlnz3/xrO+yOlClFv8Cut3s4Oo2bOhokaA=
X-Received: by 2002:ab0:6409:: with SMTP id x9mr11130562uao.29.1571602918878; 
 Sun, 20 Oct 2019 13:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
 <2d3b27fdc2a30b313e3ef63eb64cbaaec82838a7.camel@samba.org>
In-Reply-To: <2d3b27fdc2a30b313e3ef63eb64cbaaec82838a7.camel@samba.org>
Date: Sun, 20 Oct 2019 16:21:45 -0400
Message-ID: <CAOCN9rxhKTWmsinpe4jh5+CB_DSENr1KvJXrBHREGTizoUtiBA@mail.gmail.com>
Subject: Re: Installing PIDL for Samba 4.11 RPMs
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 19, 2019 at 2:48 PM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Sat, 2019-10-19 at 12:22 -0400, Nico Kadel-Garcia via samba-
> technical wrote:
> >
> > What happened to the PIDL code with samba-4.11.1? I see that it's no
> > longer in the source tarball, and had to edit it out of the RPM .spec
> > file I'm using.
>
> You can either use the build in pidl via pidl/Makefile.PL or just skip
> it.  OpenChange is the only known consumer, and while folks sill build
> it for the evolution-mapi connector it is sadly dead upstream.
>
> Andrew Bartlett

Thanks. I misattributed its failure to a complete deletion of the
software, it's the incompatibility of the current fedora patches,
which were apparently designed to add PIDL to wscript settings. But
with PIDL being deprecated this way, there seems no reason to support
that patch.

