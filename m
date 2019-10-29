Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE1E920A
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 22:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=onRtbi3f4yy2K0UrY6vCgN6n1D2jD32VR3Wmhxjt+rY=; b=e7fJVF5L1Izvwb3NCst7gpV1K9
	Eo9Mzt+cTL22iiJqnbKv9MKZIx/mUyXtuF5DajeTYXhM6tXImLtdCWKrOTBjxZoQrjv8gih2i/k8t
	nZOGAeSvPDXieF4sjuWVsKtiVjlNYJylddy86CqbPmPs7aKzJxFWo/l+aK4oK0sxA/7dd5ZHtOCXT
	1IPKhNGyBp1wWWaXoQxs3RrhJr7RnS7CeEgMglLFCoP2ah+PNIb2zeDEmsaRHk0wLTWeT1nubG3i9
	8wljKV4BSMclgFFu4GSHiDAMAZigozC54pxoaF2Bf+RO7wEHdYfjpsNo48usUsaWvHHxdnN6knilT
	LRryLYgw==;
Received: from localhost ([::1]:22018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPZ3k-003Rxw-E2; Tue, 29 Oct 2019 21:29:48 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36523) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPZ3f-003Rwm-PI
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 21:29:46 +0000
Received: by mail-lf1-x131.google.com with SMTP id u16so11671219lfq.3
 for <samba-technical@lists.samba.org>; Tue, 29 Oct 2019 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=onRtbi3f4yy2K0UrY6vCgN6n1D2jD32VR3Wmhxjt+rY=;
 b=TK7fIRmQ27W61vK/jiwqAYOOGsF7o08hLMpCVho59pXtnlEfyBEKXVrDoCXkSEPggH
 K2kiXJL25tlIPXpw6rljYtqcukGX5UAqm+mSJ+KXpKdCAtBTmSyZ8HpYwr8APT42sjT+
 h1RxToeP10hQHHHTG5wm5ZNBsZG0M6vEMLePrJ1sUK5Of50eci4N6XoPXO80qTsb82nr
 nDzwhwfqbdFY2TuAFPzR2TjbJfJOiS/FlIF1kHqVW2G3BIllhczYVYd6vuK1b1AxsDP3
 0wgqk8YPl3YfTtSnj5dKSlK0is9BxJtQMm+jSkfrWd4I9+XyspjIoS9Zp1RLbBWbfWqI
 epVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onRtbi3f4yy2K0UrY6vCgN6n1D2jD32VR3Wmhxjt+rY=;
 b=MB/67vqAhmkdMp4M98huLu5dwAsDuRtYa/Bimec0uaUcnwSkkPqIogw/bYR4a8CkKO
 LEeSZXm9MGuDSA+1kSHCX36riNQ+Cabg0TJsuTAmeQBHrZjFmMx9Io7J+luECqd6zVXA
 cAEcxCVil8ZqPYkJ2kzuHxJ5wF1bWkZfrMJYfWhcY9UL+AqBOxjpF/gNZhC3OO1uh4LF
 iDL3EjAbdECEQcELOrtyDotsVHxXr4InfjU5J9rYqlN5MsI8gK5ztOGex3npVtFUjb4l
 UCtqWNNOmaxl5G8zvEEKQzsV15k8j9tPEagHG63BHZkKQuc5PcWZpZtsmPchwA7XTj0S
 oSSw==
X-Gm-Message-State: APjAAAWx2+RueC8wuqfQpq+eWaWUfUpUhAoeGPN8XsmrrmcpSY5/UUU+
 8kXNbDUO1YX5hnNe6r3uHePUUnMRpUC3oebxeRA=
X-Google-Smtp-Source: APXvYqwlv2dBrZu7HkymCDOAzGdsiDCdvEpUyh1bsoytdoUE9XkES7GE0yS+ur6TtmQhhSlIEZlRjS41W/YTpedac0k=
X-Received: by 2002:a19:cc07:: with SMTP id c7mr3826277lfg.107.1572384582812; 
 Tue, 29 Oct 2019 14:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8Tp4FsXokCrDkXFrdD2PhFs4wVpqyjEWDjpj4smam8VXA@mail.gmail.com>
 <f1c0f4c5-cde1-6fb6-b481-adea7a8be5eb@samba.org>
In-Reply-To: <f1c0f4c5-cde1-6fb6-b481-adea7a8be5eb@samba.org>
Date: Tue, 29 Oct 2019 22:29:31 +0100
Message-ID: <CAC-fF8QxakMBmqWMwDkmw9_oE8mNM_MgP8qBOzmX_v-wzXTJRw@mail.gmail.com>
Subject: Re: kdc: allow referrals for krbtgt in transitively trusted realm
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

On Tue, Oct 29, 2019 at 3:50 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> > The attached poc patch solves the bug, but I think not efficient (and
> > may leak?). I think what I need is, to find out efficiently in
> > samba_kdc_lookup_realm(krbtgt) whether the realm is directly trusted
> > in which case return 0, or only transitively trusted and then return
> > WRONG_REALM with referral to intermediate realm.
>
> I recently hit the same problem
> and created a different fix.
>
> Can you have a look?
> It would be good to get this finally fixed.

Lovely, was fun to remember this, looks good to me!

