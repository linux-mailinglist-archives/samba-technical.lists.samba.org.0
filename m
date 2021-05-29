Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D5394BB1
	for <lists+samba-technical@lfdr.de>; Sat, 29 May 2021 12:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TQm1TYOTPZYVMrT9zLr3uw0IiEbKvZk5FyjdYgYIP24=; b=xqk3Dbw8fz9lOO9A5DpyOanCqa
	u9CCYXc5hQUPStAQ5tdfKXK4K92DDqaVUODRy8BstdndnHBUEAV99bVhgvVK27pfsFk2o1tUYEwTR
	HudVp4aQaIT+psGQmTgIy19lKtV8iKrIFBsgIadFnAxZbJJs4KMQIG9CBpFyHFiwNy+GimmNyG5Q3
	Hh7F95pPGepEit+xP6TYgX56tZ7wGZDLkhs9P/5jEPDZWi/OdVQoe3ZFVg0n+WaoVyG900zhZWtZo
	NiesMtixK8djXDJ4shAvDZHAJqkiKjADeOW8V918nyZ+NvYPW6fYfV25daCKnPfz6BCjO57dSHIfK
	IKbFakqQ==;
Received: from ip6-localhost ([::1]:19050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmwGA-005Bj3-Vj; Sat, 29 May 2021 10:32:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35619) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmwG5-005Bfe-4V
 for samba-technical@lists.samba.org; Sat, 29 May 2021 10:31:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id y7so7700148eda.2
 for <samba-technical@lists.samba.org>; Sat, 29 May 2021 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=405Upds99NtPEIUjMJnS1aHKU5KXCHj1hLT3A1XJ5DU=;
 b=drHjCrLq7AlgFUfMzICoaJ7LrlNCvZ/zXeUIOR4X27FF3nmYadX4+PpHfmB1gdqAPn
 7KnqpicwAjrrMOBHB7pe3KuIcHZwFiSaD5gEC7MeEmb5ODBLv+pRM3xMTsz3lOvgbLGp
 X0CPdLP8Z2+5Kld3C62BtILlAMZ7zoHsHV5t+RMML3f3CjkMUlofP9Zv+SUt3jYxPVlt
 tu2pvuDFvuLyNuT8c5dnMk+cTooiztmzp/fIyGwlQVFE+fUJPIhbG831UvWtBjPRtIvB
 O8PDauRlFJD9+T3a2dPMqUHsivOIg+mCZeQ284/brIiXMwLTT8c8B17h/Uki3q9bMtdf
 GTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=405Upds99NtPEIUjMJnS1aHKU5KXCHj1hLT3A1XJ5DU=;
 b=iBAVQOxBtdQ63YycJs5Q9GpzXHu+9zlX5uFSDBm139YSHsuP+CREqsO89ECfbKugrE
 CUUYRcaEvfk4hlbp2bPdP1qGMGzzGf/fnaDnJ0ZXSdAg4zBdqTL4CmrjbhBWQUexUGsI
 zxRX2FByzsuA26eRkNQepqrlqEo6ahjyLEMCEvTWXix7rG1Fy53SRWAfwDSr6FKIaHpY
 LN2+rymkfuWVGBe1WBExOsqFIowbJ2Rc3pwU2KpgsBoqUqJwk7wRLcHMJunJ9sAFqzLD
 prQ8soQx7q2Ivw5W/ZxTIP9ru0EUbeZ6nCTZBVTvFU2FbWK2jM0mx8F+C0MLTpeaNd+s
 Mb2w==
X-Gm-Message-State: AOAM532gn7GWVkc/0LomsMA8Orx8BmdQy1gGEAVhl1zal6YsSc/svu5h
 DcQ+7z82WhnISZqOzOLcmfN2M5fl0iyVTc771wsGOf3jqpEGeQ==
X-Google-Smtp-Source: ABdhPJy1R/db+Q4Q6INJRy2pBhoDxzTr4IkdvdGfneao2aPE0W7KtOcAU7HuxF1SLjQg8381jidY4Zv8mjkwEu4EA5s=
X-Received: by 2002:aa7:d4ca:: with SMTP id t10mr14868355edr.42.1622284316033; 
 Sat, 29 May 2021 03:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <20210529195550.3dc109c0@martins.ozlabs.org>
In-Reply-To: <20210529195550.3dc109c0@martins.ozlabs.org>
Date: Sat, 29 May 2021 06:31:45 -0400
Message-ID: <CAB5c7xoy_Dazffom+x7_gh7wF3ybsDsWe-860q=CKrC4Mc=hXw@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Martin Schwenke <martin@meltin.net>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 29, 2021 at 5:55 AM Martin Schwenke <martin@meltin.net> wrote:

> One wishlist item to think about... and my example is for CTDB...  :-)
>
> This is what I have so far with regard to ctdb:
https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-add-json-ctdb
Feel free to make any improvements / expand. I'll add as I have time.
