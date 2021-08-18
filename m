Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72D3EF834
	for <lists+samba-technical@lfdr.de>; Wed, 18 Aug 2021 04:47:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=c2nGkp2pO28MJRzTFh6Ka89xAPD7DAQakuOyZH1yyPs=; b=oks58obRVM5oOmPhePT+vG2og7
	E0ILgLuVzCT2IC4qmwNVoedfFQTa8uR1+xWHAmMwMwQJo9MjjHHa/L2jZZnov/8rFKnmvG/Df7tAp
	RsrpmP8GN1KO1SymZCxjGG0s1YZyHfu7AefXKjefecGF1w6/e82cSqkaLe53ZxxvH1tGG68x5snTM
	rkc7o3M6BDKPVHj2FNQaUHzl6G7avN0lH0+0y6xjOlNm+bMBcO8g0F8RNKHg6+v10vmcVUSRS1zZ8
	mOIg53nm0Yp4R0kf5u6QNa5GSLTHoA8ULL5QSxdLjFjIW/6YP9eX5Xi+IfX5b+mOMF6UBd3kJpUu5
	tCWnttRQ==;
Received: from ip6-localhost ([::1]:56686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGBb5-007EhX-4G; Wed, 18 Aug 2021 02:46:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:45635) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGBaz-007EhO-1Q
 for samba-technical@lists.samba.org; Wed, 18 Aug 2021 02:46:27 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g13so1304672lfj.12
 for <samba-technical@lists.samba.org>; Tue, 17 Aug 2021 19:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2nGkp2pO28MJRzTFh6Ka89xAPD7DAQakuOyZH1yyPs=;
 b=qh1y8agNpNkt0u3hDMltHMeuOa1zDwc+PSEgyXPU+Kl4+YEYxysyyaRbYLwsSVzvD6
 4UJXUV/6j+BSFgX1Mi+F2jKYzlcJz6UzsTKMXydi4VddeHagJ3+IogQti/X8VyCmlx5z
 2gPI0Ov204md7HGwzEvGeO+EE9Po7QWfrkmwp6EjC7U9KMBN0kcDeaVGyC+9tKUFAdAq
 fcl06nfzceZiyCwT1GM1GtS7mnAoGi/Hxyh8hTI0jbzZYeMZcenFDASN5bj332Zn/mPR
 RGh3GzBQ6ZVmeD8HPMJaGW0OkPcGfLzsXkydSb2ffhWQw9dQ8y8ldRrtyQJUTfIBnr4k
 2mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2nGkp2pO28MJRzTFh6Ka89xAPD7DAQakuOyZH1yyPs=;
 b=ugVBXT6zZCj8OlphsqzRs9HWLikMelb1S7mgYmj8jevWwGDUQ/o7j4dnvKU3MVON6q
 MILPRCcVCSa92YXzVhQZM8PVdLVaCe7aPfT3inwE77Szmh909sn6gIAizljZoR8phXjf
 jmg4qtND/yvONBIcPsKoxFmY1gZN2u2CIDixVueCgg7Trm/C1mlnnZPsaaxtn3zcAa1G
 pckeXnw3C9mnwwNN/NNiLA1MLgcQ/o3OWBuxz8Ye6/qGIT/ahq6/SmJ8NglO5lWFPTCw
 Pf+k20nvmdAbU2MDuY0mwzXQY5tsxxnqF3YTLOYdWnPX/q7dtOr+tagzHDPvAu+hFeSv
 6J5w==
X-Gm-Message-State: AOAM532MqQG5qpwVs1tpXBrrNmqpCtJ6yc1meHpKIn7PuouBoeR8iSJc
 euSBgyosCcm5uKGoJzl6fEn8m4v1tFXNiKJJ1QM=
X-Google-Smtp-Source: ABdhPJyqX4PNnFM3uy8n4gtEWd/ECyFT14HG7SXlJ/4l9ydlIL43HQMtidgxK+h3pV9p1isZ0JV7+pgS6fpI5l0te7o=
X-Received: by 2002:ac2:4350:: with SMTP id o16mr4888984lfl.184.1629254783804; 
 Tue, 17 Aug 2021 19:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210817145510.639-1-dinghui@sangfor.com.cn>
 <87fsv7h9wm.fsf@cjr.nz>
In-Reply-To: <87fsv7h9wm.fsf@cjr.nz>
Date: Tue, 17 Aug 2021 21:46:12 -0500
Message-ID: <CAH2r5mvT115ikGHAtpoLmHSn9yJ16iJDexgdUCv32ZAL4+HNKA@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix wrong release in sess_alloc_buffer() failed path
To: Paulo Alcantara <pc@cjr.nz>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 Ding Hui <dinghui@sangfor.com.cn>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending more testing

On Tue, Aug 17, 2021 at 7:33 PM Paulo Alcantara <pc@cjr.nz> wrote:
>
> Ding Hui <dinghui@sangfor.com.cn> writes:
>
> > smb_buf is allocated by small_smb_init_no_tc(), and buf type is
> > CIFS_SMALL_BUFFER, so we should use cifs_small_buf_release() to
> > release it in failed path.
> >
> > Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
> > ---
> >  fs/cifs/sess.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>



-- 
Thanks,

Steve

