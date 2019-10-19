Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C0DD9A1
	for <lists+samba-technical@lfdr.de>; Sat, 19 Oct 2019 18:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gzQi94vXkEMJqZAWqHDtRP+TTdqJfOZCqNbADY6XTGs=; b=MUNNv+Cmpf5hmLffipcp0TrlZT
	nuT5i017lJkTvMJzDAps7fB4Uy7zPHcV2mm0L8SS7LYm9y9nGiBElt3t0ycA4HlhyvFG/eT13fZUr
	G0yL14Zimh/Q/5vfgPaB9XOP9ryBdbQq6GlPSiqcRSAhFXTadkvHhVjqDmu3Yml3YVCLdo6LmohnK
	ke4VMDwdZhPPdzyaXxxxBU5SN10/N46jUs2bo05TWyzQaaT+jSE5sVNqu4BYZdQ+C+WA2u0dtA4cj
	/vL8/xEczc0tYYVvWzhjQyKCGQpQLiAe60T9QEaLZHFI+GF9CetZWvUEfOoX6b+SO8qr6UXYtCWet
	Y+aDeJcg==;
Received: from localhost ([::1]:37774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLrVE-000dP1-AP; Sat, 19 Oct 2019 16:22:52 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:38378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLrV8-000dOu-RH
 for samba-technical@lists.samba.org; Sat, 19 Oct 2019 16:22:49 +0000
Received: by mail-vs1-xe36.google.com with SMTP id b123so6142221vsb.5
 for <samba-technical@lists.samba.org>; Sat, 19 Oct 2019 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzQi94vXkEMJqZAWqHDtRP+TTdqJfOZCqNbADY6XTGs=;
 b=nMeZkiygo/4tv6qxFrYQDaoBhURZh0joylH8WJlHKyPLQ2r8pcjC0Jsq0mcqKiFe1h
 zqFPh595h+o5cuHx4jcFre/FiEFH+mmtpDJ6eT2xl6BhAJm9FlB14DOhWx7DptchOyPZ
 Bc4NQh5s9/gXHwWNkIFh4rVHq335jG4dW7pwoedPiIM+onYi4t2YmzahgnKfXcAtgn81
 t/ixZ/Cp1Cj4CzMHApnzAB80/04pcCNOXs2t9jBDylmd6CtwnMJF6CjAC/28CZvQ6CN8
 PIeTmTc0bxBE/65oUbnoizhPZ+rAtUb93Ag5GetLWUJQ7i3wgCt0VzowxqAq/RgR6/MG
 0oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzQi94vXkEMJqZAWqHDtRP+TTdqJfOZCqNbADY6XTGs=;
 b=s1k0VdlrbHb0kY6YykEyn5jC052mP8FK7pFou01LEBqvVq6SyZBU7wwUYOy04W1cFH
 PoffQmr51YBR7Do8nbltt7bsgZvvcMNJhwYUpFwYGTkqZBp3mkTxBpuL6XGDaken72eU
 +GIHyUQUGzlFxEVNB9gGBszAtMIVDdcvR0avqkGnQFgeo+U733RHBz9F8rJQRJST2S+M
 sUpCU/FQzpnY7FjtUjrmSRgMXqKq5B5NpUYwEmKaX77cHvrjS15bD9CjCwlEKEQquABF
 bRBblmAHMIS/XUqyIhOoVDSmRCrOg/ZDhJe3tBQy6je4lLd0Y5rwVt8KfUYcYCSnkZ/H
 973w==
X-Gm-Message-State: APjAAAXByPaxHsTf87wIvkSwPhJNm/Hik8C0hm4EPquivY6cODOUahG0
 rqbp1Lz6hMry3SHlJc/q17bmS+aSBD2mVEdPURafcAuQ
X-Google-Smtp-Source: APXvYqzwc6meGgNZr7u105/wyRugBfBnq1C3A2WsKsGOv7OdcmedGKv3RhAP0dUr1n1rH/J5Cr5ddvRWDwCJa8Df+IQ=
X-Received: by 2002:a67:c307:: with SMTP id r7mr8592905vsj.97.1571502160209;
 Sat, 19 Oct 2019 09:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
In-Reply-To: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
Date: Sat, 19 Oct 2019 12:22:28 -0400
Message-ID: <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: Karolin Seeger <kseeger@samba.org>
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

On Fri, Oct 18, 2019 at 6:05 AM Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Samba 4.11.2 is scheduled for Thursday, December 5.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
> has been updated accordingly.
>
> Cheers,
> Karolin

Cool! I just managed to get 4.11.1 into my published CentOS 7, 8, and
Fedora setup at https://github.com/nkadel/samba4repo. This setup uses
Heimdal Kerberos, which eased the gnutls requirements and made CentOS
7 easier.

What happened to the PIDL code with samba-4.11.1? I see that it's no
longer in the source tarball, and had to edit it out of the RPM .spec
file I'm using.

