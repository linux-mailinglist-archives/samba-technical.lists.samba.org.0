Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E48AE2B130
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 11:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XDwgH3FWHRfHABjxiM/xZIKX5Pbg3UrkxfQn/B2uE94=; b=CStqa9JWCqGNHNnS9ZUO+ecDH4
	nLcMInFjzHa9RJjb6R3CfpZVodyswjGjCFCDRd3ZK4Z9u3ijOqSSTF9U5s/bR6jrTQRhSdRcB695o
	V7pTBK2+rS0JclYiEI4bk1Lx67AsHRyYI3CK6uJqY/jnGzwwcycqZGB5OltKoO2/REgnEnc2LXfhK
	E08qafGsFKUxBe2pF735/VNjVFRE00u6mao3Yf/2klbAnnnxdp0fZM8eDJWU+bWNpHVWTvFHUk7ka
	nWrZoWAFsUEGxC8oGSTKAMmvnNFcZlAs43+qbhnfJOn5RqHZRID/cmRy9ak1OZfB7XlMxJXH/yaep
	S/pXu0uQ==;
Received: from localhost ([::1]:53846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVBkT-0029S1-KW; Mon, 27 May 2019 09:16:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33569) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVBkN-0029Ru-Mm
 for samba-technical@lists.samba.org; Mon, 27 May 2019 09:16:49 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so5994758wmh.0
 for <samba-technical@lists.samba.org>; Mon, 27 May 2019 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDwgH3FWHRfHABjxiM/xZIKX5Pbg3UrkxfQn/B2uE94=;
 b=kHgkwecBNqooZ+U+ObaKxGTtbJEFe3amAy2glfyxGv6TdDwNU3XwsvH0Pta7Qf6xVQ
 XXb34YWBCO5KA+3f9bp4yMfo6w0I16jOWrFK0qc1Xpp16PhU/Rm43ijECK6xK5SWrTuK
 9o6Ju5j1+Q8AoALURroxclkZ5wDlJm/IYOksqVT6BopBf8+Zt3djTtHhpr4Y/9a0T2P5
 dxhf19DiwUw0gkjje3Go36Uk0/oRsCm7kjICh0HuknZdqIdaxTSozySAf8NpqsWJ4Ivt
 cW4YpoBjTZQola5F+t6NaX+7+o+b04XFoGBmT951DKWCnAJ+drrt6pbRHYmQr2PdNuHd
 zBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XDwgH3FWHRfHABjxiM/xZIKX5Pbg3UrkxfQn/B2uE94=;
 b=oBop7W/t8j0iXdGYqRBjtN53IRmZ5kzFlz3ohsTfWAvKb1P3SZ1VdHMEtAMjNxuMjN
 c/CJSFy1hZo13yXZLD52PNSut/n3dEYt9uDL1jcZ2cIR4BwhFXy3lpZNkk3wqegaqX2Q
 f/HrOWy/HKUZesWf5F60NOSsyg0bTepMCjJ+x2n8QaZF3taZ4dfadTts3O9cWr+WdQ0d
 Lt31Ovm6eXrfRzpYWj6PWSuZU7Iw3DiplYLhEvRGCaLTqv93iF1Y3zuK+UM2IREF9Dhx
 ir5Xgt3ziJyV30ymk/4Qob0u+Ek7O3HcAU9ttpD6krnawqRbtlVgyJhfwZG2QQq//LZH
 KDRQ==
X-Gm-Message-State: APjAAAVUxEvMUUmN5F2RYSSEv+HwYVBxMsCPs3O5E3QJxUezMkLjsHZ7
 GAn7c+laJ+6vHeBk+hB23ZA=
X-Google-Smtp-Source: APXvYqyWIXyo+WZ5ffVJIn4cGorBEuJmUjZP6pc/1AeDsSvXKE+w1D7IUHMNpua2DNCOoEOT5qr1+Q==
X-Received: by 2002:a1c:cb05:: with SMTP id b5mr9301559wmg.146.1558948606723; 
 Mon, 27 May 2019 02:16:46 -0700 (PDT)
Received: from dakota.saitel.loc (93-34-9-216.ip47.fastwebnet.it.
 [93.34.9.216])
 by smtp.googlemail.com with ESMTPSA id p185sm962708wme.2.2019.05.27.02.16.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 02:16:46 -0700 (PDT)
Message-ID: <133b8c68229553e9c273e1bcc5adeda0e3d28706.camel@gmail.com>
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Rowland penny <rpenny@samba.org>, Alexander Bokovoy <ab@samba.org>
Date: Mon, 27 May 2019 11:16:44 +0200
In-Reply-To: <aed6ac60-f128-6890-5ac3-8178e67cab06@samba.org>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
 <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
 <20190527082719.GA4871@onega.vda.li>
 <aed6ac60-f128-6890-5ac3-8178e67cab06@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Daniele Dario via samba-technical <samba-technical@lists.samba.org>
Reply-To: d.dario76@gmail.com
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Julien =?ISO-8859-1?Q?Rop=E9?= <jrope@linagora.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-05-27 at 09:50 +0100, Rowland penny via samba-technical wrote:
> On 27/05/2019 09:27, Alexander Bokovoy wrote:
> > On ma, 27 touko 2019, Rowland penny via samba-technical wrote:
> > > On 27/05/2019 02:28, Douglas Bagnall wrote:
> > > > On 26/05/19 11:22 PM, Rowland penny wrote:
> > > > 
> > > > > How do you test for something that works on some computers, but not on
> > > > > others ?
> > > > 
> > > > With Gitlab CI.
> > > > 
> > > > > Which is correct, it working, or it not working ?
> > > > 
> > > > Well, when I go
> > > > 
> > > > PYTHONPATH=bin/python python3 -c 'import samba;
> > > > samba.drs_utils.drsException'
> > > > 
> > > > I get "module 'samba' has no attribute 'drs_utils'".
> > > > 
> > > > Maybe Python 2 was different.
> > > > 
> > > > > If you have a problem with the test, take it up with Andrew, I
> > > > > initially
> > > > > created the script following his advice, he later 'improved' it,
> > > > > obviously
> > > > > not enough ;-)
> > > > 
> > > > Yes. It only tests 'samba-tool fsmo show', not 'seize' and 'transfer'.
> > > 
> > > That is what Andrew wanted at the time, feel free to extend the test.
> > > > > Anyway, NACK to your patch, but only because you haven't remove the
> > > > > 'import samba' line.
> > > > 
> > > > OK, though I don't it would work with the line removed.
> > > > For example, it would break
> > > > 
> > > >           forest_dn = samba.dn_from_dns_name(samdb.forest_dns_name())
> > > > 
> > > > and it *might* break other things too because, as discussed, Python
> > > > imports can be a bit weird with unexpected side-effects.
> > > > 
> > > > cheers,
> > > > Douglas
> > > 
> > > So how do you propose to test for this ? When having just 'import samba'
> > > fails for 'samba.drs_utils' but works for 'samba.dn_from_dns_name' ? To
> > > me,
> > > this looks like a bug in python.
> > 
> > https://docs.python.org/3/reference/import.html is the canonical
> > documentation on how module import works. When you do 'import samba',
> > you are importing samba/__init__.py implicitly. That file defines what
> > is in the 'samba' namespace as imported. It has no references to
> > 'drs_utils' so the only ways to get 'samba.drs_utils' is to do 'from
> > samba import drs_utils' or 'import samba.drs_utils' explicitly -- in the
> > former case we'll get drs_utils directly, in the latter --
> > samba.drs_utils.
> > 
> 
> Thank you very much for explaining that Alexander, much clearer now.
> 
> It still doesn't explain why it seemed to work with python2, but I will 
> put this down to one of the reasons that python3 was written ;-)
> 
> In which case, I remove my 'NACK' and change it to RB+
> 
> Rowland
> 
> 
> 

Hello everyone,
I reported this problem some times.

If you google for "samba 4.7.0 AD DC: FSMO roles transfer error" there's a
thread (started on Oct 11, 2017) where we discussed about it and python version
was 2.7.12.

Daniele



