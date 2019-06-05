Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9323563A
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2019 07:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QMYP5m4h+46T87MzvmapcZ3CNJdyoV2BD91qBakiATk=; b=lwC7seZ1G3OeM6e0Awh3t0Qeut
	jj1JHr1TY78VjBlGjnaKqWotLsnD9ySrT6sZmKqH0/VXbho4BrXwOl3Jg3Z02eVn19jFyraRq/F/3
	Ymg8HWQaifvYc7Wq+vsbE1+6IwW0By8Jx/Ofv8NImI0fOSzc2we/NoRm3Pp9mp6iJn8K/6PB/hF8s
	yjKxT4X+LVDldOfZlc8Y922cdXBdgsDo9MZiTA1uBNXI/+mHgJC39FSKMRjRT2j6PXPzIDl3ONFnw
	f6N5pUWJTy+SCeY7NwQcr34qp0fQeVkU8jlxyprwhnfbD01eDZnqUGEe6z5EcSXZ1Xsugb8VZ12TK
	P8QZ/71w==;
Received: from localhost ([::1]:37074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYOWX-005BGD-DP; Wed, 05 Jun 2019 05:31:45 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39815) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hYOWT-005BG6-BL
 for samba-technical@lists.samba.org; Wed, 05 Jun 2019 05:31:43 +0000
Received: by mail-ot1-x342.google.com with SMTP id r21so9343328otq.6
 for <samba-technical@lists.samba.org>; Tue, 04 Jun 2019 22:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMYP5m4h+46T87MzvmapcZ3CNJdyoV2BD91qBakiATk=;
 b=meQ7gKpsHvUije/bYP1C1JxWMv68+HARI9C/b+UEIEA03LfxGD3KPYqWMYVwDqEruu
 be49GUkkhfITUpE2v92+bbr8YbBnA8HZxt7XZ/03Zx2PT19uzXAYF1I28TLGBEGschmX
 PbziY2/VVeEkpPfcBtUJ5vwhGfhew7/GaiD++oOe6YImS/RnSSChMXf2pj3gSUrmO3WP
 XI73PGiXHOQxfxG/Y7svKkcaYT5aZ4gMvdnXz51Y6ZdsC2yXNXnLnM89BbgngHtwa+uU
 HAdjJJNq1cUyceYyTbYJNQ1QXtzyx/PcAkEQl9qZ9y/2vn6yqW7xUWH37wrhwn4gGYT4
 SSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMYP5m4h+46T87MzvmapcZ3CNJdyoV2BD91qBakiATk=;
 b=cfTWF4HjiB/SJE5clVcF7n/BStEK5LQ5LFdyURxhlGKpb5vj35r6GfIkD11E68PgBg
 mSSlwiBZhvhGug8Ap9OVJEliEJoX6l/e85/sA2mhuyy8FFTSSrOqgByTjnLzkHHNpKk+
 +d6Sds9OcUogM6S+tLOZsnSSa62JqjywQepgRn8VievuzC09/gE8jQP/QrVUOhqoaPcn
 ZtXao7MsAy6OldHz6lmzRQBJmiusTBrEEBby7wFY69/EZ3mCm6TV77/rQ13wykbRXGfB
 duKnZJbAtoEFOd1qnnMCbkGg/fTzB09Ripj1TBpeBm8vQXLez6bE9scn2eqT9CG+WnLV
 uMOQ==
X-Gm-Message-State: APjAAAW/GYAwV1zZrDRob9uj2J0M3FHGSzww7XvvbomYTNDvlotV6CaW
 /bMAHnLAhNELwR4yLFESjyU0eVWjQrtF1+IMnU/7Cebb
X-Google-Smtp-Source: APXvYqzpIlvK2dYgGDHxRlCk7MyVdkMkcwTJZMg4hKmBzapRGCGIUOaWVO2wBB9WrymjrA02ilmGU4Qm06M7h8gIc+U=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr8378568otk.232.1559712699084; 
 Tue, 04 Jun 2019 22:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190604205402.4fadccb9@martins.ozlabs.org>
In-Reply-To: <20190604205402.4fadccb9@martins.ozlabs.org>
Date: Wed, 5 Jun 2019 15:31:28 +1000
Message-ID: <CAJ+X7mSFiLuQHXJ77jQ=PRRzv=O-+gjPqWBAoSyZ-g3t4Bn1BQ@mail.gmail.com>
Subject: Re: [PATCH] Fix CTDB csbuild and Coverity issues
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

On Tue, Jun 4, 2019 at 8:55 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Here are a bunch of fixes for things found by csbuild and Coverity.
> This doesn't fix everything... still more to do.
>
> Please review and maybe push...
>

Noel already got to one of the fixes in ipalloc_lcp2.c.

So pushed to autobuild without that patch.

Amitay.

