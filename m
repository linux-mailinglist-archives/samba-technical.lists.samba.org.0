Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B6324CE5
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 10:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=atS+6z0q77U4wFZOsjvxrTzG8Hq0xK3sBns9gBoqHJ8=; b=5L8YxnxLsan+dotZyouk3Z2/UT
	hv0+EOuyMEjdEvFw1/kRxrBVMXQ0zuhWLzpw+6ZZprTxw9B9BnYQeNaRGJ6XWbjzPUtS4QtKArPo0
	yyDJDqrGjZ1IreZRJltsEQLAJjaJ6TIkIf9DxQ/cJGIF9DTeg7F3csmi2YNizLMdBA2IAm2nU4Siu
	Eu35Wn306ezF7km4k+tTsP7m6eKFgSU3qZXxCm6y3d2tzhKqlTKE1x9FBcN3kMWSwlcKYKBgkY+2L
	vT/THdcGqFLe5a8OIi/iTwu8fvMdQKt1e1yp1U8whSH2MluzWK3/lX6h0W8cUrEVTQW3EGNBz0ASu
	WckVPD7g==;
Received: from ip6-localhost ([::1]:44286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFD24-001KWp-NS; Thu, 25 Feb 2021 09:34:04 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:33912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFD1z-001KWD-G2
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 09:34:01 +0000
Received: by mail-il1-x134.google.com with SMTP id q9so4361636ilo.1
 for <samba-technical@lists.samba.org>; Thu, 25 Feb 2021 01:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atS+6z0q77U4wFZOsjvxrTzG8Hq0xK3sBns9gBoqHJ8=;
 b=htHqj3ogDOj0J40UoKhF30pP7xNSk76Gl5/e+YsUXY2m9phxqUoOPFaG/OR8FGM532
 kOPA0mB2QO4gQ/DK04R3QwT+g2r2uJ5pQ2PNLmoC6jnlb7kxTT5jTr4wqRyqTZuWfc9O
 e8V2k+LzSd0vaX3C2QB6GtZGp65Zvq8Ghryt21Y54c5aXgipT6GMrSvC9KbKu4/aJTXC
 YFSGEgtgPnChuQU1CXBHjIwWM3wJ5y4dm/sOolAv3wzQutOBCgU3qamgrMHrGB186FPr
 4rwDbJkQDrJ1SsbkL08prvpw1rg2+vTnyMrKPqXAguGjF7NKhJrw0P+EyY2JpF81EpHD
 DLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atS+6z0q77U4wFZOsjvxrTzG8Hq0xK3sBns9gBoqHJ8=;
 b=VCo+gvpZ6DeH4+0LscUYIYrzWJicgrcz96Ie6PFnb49yBX//2Owss9rt7BCBGWLZEY
 TA9NbCN+TfYTRpj21ZURl1eHRhREQuVdjdwnksEnkpW843mUXb3MJya3Llg81NXCwyIV
 CmUqpGPMuNW5vEu6QSE7k6CTJGXiibmEoJxtF4jhcZKSP2s5wuljpwzYQeu/9F0xfX7+
 1CjbLyyJKK1vA9b4pBK6DGsrUvdzYS8jJHJv6MDSLr9sqVBFN6K3ucIWjCzSXQx8ILCA
 SJf1qqr9JutqMA9WHQYJGsmlopkCRWNwKyBK45jx6Obfm4BMKaoJ99WtzjOueII+jpv9
 w9jg==
X-Gm-Message-State: AOAM532VhVRDKQ14RTl81nbiXA45GuME7ShK5QhVccTChNXZVHMIRZs0
 kFhKOmMJKIwYEhnMWdB3X79SvS8xPrpLV/YbooMSAbKF
X-Google-Smtp-Source: ABdhPJzeCEBkthoWemBVuSOWqc0tOfZ41rQIiHIvEbgdj7leFbTDTUAwQ+y6HBSk638JVu3tfdGqzft+L3ZV2ghrmng=
X-Received: by 2002:a92:ce4e:: with SMTP id a14mr1779857ilr.219.1614245637600; 
 Thu, 25 Feb 2021 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <0736dea6-ab54-454d-a40b-adaa372a1f53@www.fastmail.com>
 <CAN05THRTEXjZ+TQB+X2kA_i8CgKctBDB1UhbifAu0WzqHOuNmw@mail.gmail.com>
 <cd9f90aa-53f0-43a2-9683-b5730d01ca90@www.fastmail.com>
In-Reply-To: <cd9f90aa-53f0-43a2-9683-b5730d01ca90@www.fastmail.com>
Date: Thu, 25 Feb 2021 19:33:46 +1000
Message-ID: <CAN05THQfXstKOvVMN-KGBk6bdkUaQCa_4CY9o5oXn_qDhdW9-w@mail.gmail.com>
Subject: Re: Using a password containing a comma fails with 5.11.1 kernel
To: Simon Taylor <simon@simon-taylor.me.uk>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 25, 2021 at 7:18 PM Simon Taylor <simon@simon-taylor.me.uk> wrote:
>
> On Thu, 25 Feb 2021, at 7:37 AM, ronnie sahlberg wrote:
> > Hi Simon,
> >
> > Looks like the special handling of escaped ',' characters in the
> > password mount argument was lost when we
> > switched to the new mount api.
> >
> > I just sent a patch for this to the list,  can you try that patch?
> >
> > Thanks for the report.
>
> Hi Ronnie,
>
> Thanks. Your patch resolved the issue.
>

That is good to hear.

Steve,  can you add a Tested-by for Simon and maybe we should have cc
stable so it gets into 5.11 ?


> Regards,
> Simon

