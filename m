Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B823B7E7
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jun 2019 17:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1FfrdJ/vmGZsrQFGMhDI8rALYY2ixaZdIuY623gQql4=; b=r0k8r2CkSokxzrhTmgIh44IPbn
	LKueUmjjv+yCWktAJQU/UNK0znX8VQXhcf/3hsZzpkja2ItYg2QeB5810Kxs6pyXFV+7g+DMmkHSt
	eV0aMqAWqOkkqaS1eufrIwk2lSMMQ3KQrKf6XTnDcKa8Y973C/orgYlDrBqqb1fITX5MZmrEXQXmh
	VZKDYqkuRUfy2ZPRlac/OeUNMK+k59nY8ZDaWb/WBkfW87ZjEw7kTiLXgJa9xF3q57NSEIbggfejK
	wNJkaotUxsRmlgOG3BJ2HuzFomx+OdB5P8VMc4Skh5nkeYSTyHysQMsn4kRfPySRp45MPlpJs3Phm
	G8xG0/xA==;
Received: from localhost ([::1]:26040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haLmV-000kpI-OH; Mon, 10 Jun 2019 15:00:19 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33793) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haLmO-000kpB-MB
 for samba-technical@lists.samba.org; Mon, 10 Jun 2019 15:00:17 +0000
Received: by mail-pf1-x443.google.com with SMTP id c85so5484000pfc.1
 for <samba-technical@lists.samba.org>; Mon, 10 Jun 2019 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9gPMTsHH8G6B8r86p/gdzoNKKPhTO77bLFE45UBhY2c=;
 b=Oe2IiYLvQcywsfKW1zwbQAYIFPtl+mNQXcnjutCNEtpulSye+8mupkHyiwNWT/H0P7
 bxzRPkiWUEyc0Hb2XYrRp5+/lf6+KB/JT7OLkYu7WbsRRgXyrUe0hUpy6TRIt6piBCn6
 NQEt/eu9arm6KsQw2APDqxK3uopceIFHiFL8EFMloNST2CwG7mNHT85yWF9Z/ST94oTe
 lT2vCg4vVsK6WkNklNhIGFZMLcJaNX1hlZ8AS0OqX6XcutN6z02BqSvB5/khQTg4lUwV
 yoL4fP9B1SvUKKu6NhY7Qjbrn71QYBRT6p/IiX9o1VtOKVjub8mXfucnZyex5PNjtwwH
 A0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9gPMTsHH8G6B8r86p/gdzoNKKPhTO77bLFE45UBhY2c=;
 b=U7CVieKF+Yjts36RbPekjGtLwHiEHCWdxQwfshtqDY7R996NLmdyWU3FkSULhwoIXR
 rbBj7YBkcouuoRoMtqSV1vhF7tExbpiCMzIuZnInLhsO3JeVoOSp3gIvUfyj87rVHysk
 CZBd7pNkCSIjV91z5abiDZtzUYrYsFGyzJZqluZT0ZjbdCpp7Bh7iT2j1psqYjm+cHAq
 QaKq3Yaa111RcH6N+uST78TPwmSlK9tQ4IY2G8ADMHF6WO3f6UCZ5mSbM8507g8cRgxx
 RAqzkn5UTMRlKd8IpJAFO2nAE+nM07OqNasBLU4AyEOPac+NsxqlKCmSBbhyHY34i1hq
 zeHw==
X-Gm-Message-State: APjAAAWNv9lzU9ipud571DkVguW6kQSWv5+dDumzxxMjsDcXRAUgVFx+
 5tFvxTe/gBk+ln+JLEFe7x0MGJGbW1RcSmLnZdo=
X-Google-Smtp-Source: APXvYqwIKvgXSRqJeBSTLm4KX99yGJyCWJwmcKzsqEWQS6VxQdxa7dj4ih7cQdNR3jxJw7vphPbzhUbE8VT+5mh3Jf0=
X-Received: by 2002:a62:f20b:: with SMTP id m11mr22473934pfh.125.1560178810491; 
 Mon, 10 Jun 2019 08:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
 <48763148.viiOTLWQpP@krikkit>
In-Reply-To: <48763148.viiOTLWQpP@krikkit>
Date: Mon, 10 Jun 2019 09:59:59 -0500
Message-ID: <CAH2r5mvP2O2mzLB7hLntG9a_P9Z1wYneQ_jMKXT4-c0m8h+A5g@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 10, 2019, 09:56 Andreas Schneider <asn@samba.org> wrote:

> On Friday, 7 June 2019 22:23:30 CEST Steve French via samba-technical
> wrote:
> > I am seeing more than double the performance of copy to Samba on
> > encrypted mount with this two patch set, and 80%+ faster on copy from
> > Samba server (when running Ralph's GCM capable experimental branch of
> > Samba)
>
> I'm sorry but I have to disappoint you, my name is Andreas and not Ralph
> ;-)
>


Can I blame autocomplete or lack of sleep on flight for typo =F0=9F=98=83

>
