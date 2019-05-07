Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D8158A0
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 06:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KMlI2sAc88+LAwNdw9huNXUA9arsnNk1IqVyqv88hPY=; b=SwcbzlF3K9mKZ1ph2c7WRTwthw
	fq0pE4Q/HquUxJWBa8YNsBRLZryGlL1txj+0heZv82JM0obM+FVxbC0OsCM0ZJCmUFGeZrRafXW2w
	gVN+BYX5pbPPvZd04k9JsBYWtnR+InjVoMOLt7UBtp0YG7F8jGUOqKNLmkW/qx3cKsiGbwSALKb8/
	FWxyb/HcTDljVuXfBv2N4a9yKB4bi5OcbvviwGXqc9/met9np6X48MZFMks0k1tf5AXU3HEOEQ0jF
	9WsfLJyKHNdHn4XBfs43tPM/QYFJEHhmSg/KoNFhXbyFEUlYlB1xgvhqjRw1eY9Ikyt9HnrngRiHN
	mx0pFtlA==;
Received: from localhost ([::1]:45430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNs2w-002pA9-Ej; Tue, 07 May 2019 04:49:42 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45263) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNs2r-002p94-3j
 for samba-technical@lists.samba.org; Tue, 07 May 2019 04:49:39 +0000
Received: by mail-oi1-x241.google.com with SMTP id u3so5568672oic.12
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 21:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KMlI2sAc88+LAwNdw9huNXUA9arsnNk1IqVyqv88hPY=;
 b=bmo5sDRhHHB3/gmkNOtbsc9VhJjv58pXiD+JErU5FtdfBK5xsLKTq6+eZweE2D/Xeo
 WZKodOmPB1THs+AkeWd+QeInhz8YAHzgspA/LslRjK6dDFt1wpNS16fSXYj2q5CyU3cj
 ZcSU1eP2pcqEjKT6I+7+ZKIVv+UeDxdWIRGtsuzVeZjk4rz2swmkCvcA/gvXsjDkGdQG
 w4loGUA81SpD2UDN8ERRp2yDvR5wn4+WX2nPn2rMDJk1SORPZOHOlXVRF/kXIzGa8yhE
 7OodvK2L4SwZidTKo6CCKUtIjYHiJxnXmZhF8xRJUfMiiixzcAL00zJx1f9EKv22XpB6
 4juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMlI2sAc88+LAwNdw9huNXUA9arsnNk1IqVyqv88hPY=;
 b=hL0GrT78IBR+ccrgn3zsxGz5xKEec9gOPGpO+8YPOO+iBKaTQxfVhigClhu7P6QFbT
 300+RxqlXYPyGfWOdH6k83YkvZP23D7j0b6gVg/l1LvTj1qmzx+O0Ajgyrw37GRYkjYw
 75fiZuBB+y9VvyK6QhtG7hgVLnaUlgzbu48YSpc69gL3nGOO8M1CRnSWdkKGSMNLrhe6
 vpuqimDAiVGcCOB/PsDYNtwFJlgBukOGfD7+pppQ+AWwsIYbQoCB5PvhP0bxvGhLw+v1
 TN7a5th8HkmZxDYLB/gC85hHJXcozdOcRTtknahI207yAbIL+QLorsAycMghUVvA9rQb
 3x2Q==
X-Gm-Message-State: APjAAAVjfZ/ZvFUlt8aDp3LiwcY8mTZaspX9udq3CtlAU3c+EThQ6vqh
 HnlYW12eDxKR+Fy1Cr/G9aX3sm8Gd00s3soMYggY6w==
X-Google-Smtp-Source: APXvYqwRD0K2GHi1UYqg+9YB2e44TV7b2ltd8taL1KYgDC+d6UJqnufpDcgxI9LQYpGWdeTz1DMmO1a70zyH8MlBf5M=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr1242528oif.140.1557204575246; 
 Mon, 06 May 2019 21:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190502204600.089e54b9@martins.ozlabs.org>
In-Reply-To: <20190502204600.089e54b9@martins.ozlabs.org>
Date: Tue, 7 May 2019 14:49:24 +1000
Message-ID: <CAJ+X7mSR3Op398fXsXBtQv0BG7k-H=sw5O0K4rm_kfSn__Zjuw@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tools: Fix ctdb dumpmemory to avoid printing
 trailing NUL (BZ 13923)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 2, 2019 at 8:46 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This also fixes ctdb rdumpmemory.  A 2nd patch extends a test to also
> test ctdb rdumpmemory.
>
> The next patch set depends on this one - the updates to the tests there
> expose the problem fixed here.
>
> Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

