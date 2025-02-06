Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B6A2B23B
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2025 20:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=e+KCqWWLi7fTb5ynkkDqBLAQEP5bw1n5phvPUiXeTMs=; b=jALarrxocHhsQXjCXd/zxcttpo
	ezGg+nDKW1CVX4SSfjtNDQDt+2SfS7aPhffojfUfcef5jVE0+pSd4l7hLvYAgmwda4oAbBz/+KG7M
	ykKNpAr2bRtIZdzuuqqSpkJ3/Pr8kX0ADk86bsWrIgDz2wolr1rY/HpxDTpOohAqJjDwD+Huy0otB
	bR8DOKeUn9t+xkb+RmfyjXaSCLyA5xzC9I7W4gzknwo6VNpAyG/3skDdfiVSsy9JgcR70+vbEO/GM
	G7n9zE05kAjZ9OyP11n8muf/M7YSutAKmc2i8rzaulp7M116qcSJiJfGRDif+g1Ga2mbh6DSen8OQ
	1hcuGWEg==;
Received: from ip6-localhost ([::1]:28818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tg7Wf-00BxgS-49; Thu, 06 Feb 2025 19:27:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:51266) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg7Wb-00BxgL-Lj
 for samba-technical@lists.samba.org; Thu, 06 Feb 2025 19:26:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab77e266c71so109476766b.2
 for <samba-technical@lists.samba.org>; Thu, 06 Feb 2025 11:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738870016; x=1739474816; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e+KCqWWLi7fTb5ynkkDqBLAQEP5bw1n5phvPUiXeTMs=;
 b=WCtNFxn3KfzC9+UT6bR42bze/++byH2G70gMSC30OdnS/wpcpEp253uR5o3tG+GLtC
 zDGuof0yGnVueC1uwJ1axajGyp+OV0OQnBKZNEiOxbnmG1ir9KT3I1JRDizvvBq/1ir3
 Bussf2+upT+Qi5pOzLLDS+4gnqg1VfmlSemQb1HXKJ+vcYufCgl80vVB/VQZlkrmz+Nx
 rMJ7jJWrBd3UkUZRdi5D0n/h/+NyPBbvrlZJlugWURo/TAoTm/7qm8ZXhyKTgY7B5PeN
 Tpag+UlnSdsDu1Z3LuO8IKMP6vbS96LVQSnmZ03e6mPG0B0kUocQMUh8nsxHUXXyKi6E
 XRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738870016; x=1739474816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+KCqWWLi7fTb5ynkkDqBLAQEP5bw1n5phvPUiXeTMs=;
 b=uvb3WzILtBLHbOy/S919l0RPjnk/Cg74hS5nCIbRtcCIbdH3JrTrbuQS0hGzHWYVl7
 9BsCBMp2KCKJJNhgmss5OV0QpMM+AeRtURjSufodf/KbRrnMxGCGeMra1Um0xm8tGrpG
 GUHNJitrX8IBykjMMwrUHCEObCKOfwxruBD5XVq8CVouTk1plselZ+NyYfIAQT4+mM4K
 kpTFZGVnCqKVJij6FBjsLs3Dj/dC40kjktyBGKVeo5ZozAGrcM3sXf9rQWUTHV1wrZGi
 8iARO1gGjdkOEhrNeRJaYIjgVCMDWIyctdRsrUNpBv/erJo1r3bxHahr4dd7ZAGBwsJP
 atSw==
X-Gm-Message-State: AOJu0Yyr10jfrswCCSxSxk6dLs77qDZdd1Y2Du0TsNxn/H1pmg5vpcKX
 xbqFkbOzYpBxgNa1JlZWmrsSf4OQ/4G0wm8lpEWE1gxfn00AXtlHHKfhTw==
X-Gm-Gg: ASbGncuJlk7bfxxb7R8pFk+Pp4F6dDa/Mfjgv4dNPzPFfbXy8CvFpL8/PSdth5K0F2Q
 +00M2kHK11YjeLU8+RGpnfueZJOnH4FZRnq9eBMcgJMuHUr8FqFEn8pBrFnL6vz1QvsKA5uOf6s
 KrhRt+/sAWkdekoDSu1bolxZn4L8zKmR5sz9mJ7eZaab9kZW7JHPUi+wVaSjCVrS0fOLrSgyP+A
 Rvfl3QnjjO+iy4q0JVOXjaBfqdn24kZeC+XlIlpY47/CelEGu8d0qJsw7RDk69KNpv/gc8Sxkd9
 50iVR5p9pnV+mfUMgBF9LNMC
X-Google-Smtp-Source: AGHT+IEE1T18lDh0TwEfByRchvdq8A5kyU4Rvlg6KPmozywDoNmBrYwOa2EQrBBW0zvSj0LK/UjbAg==
X-Received: by 2002:a17:906:360a:b0:ab7:5c95:3a66 with SMTP id
 a640c23a62f3a-ab789cbe59bmr11112466b.40.1738870016158; 
 Thu, 06 Feb 2025 11:26:56 -0800 (PST)
Received: from [192.168.10.109] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f8930asm141814866b.71.2025.02.06.11.26.54
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 11:26:55 -0800 (PST)
Message-ID: <698d243e-c39f-4a28-9fa7-88ca64aa4f7d@gmail.com>
Date: Thu, 6 Feb 2025 20:26:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: error accessing the wiki
To: samba-technical@lists.samba.org
References: <CAHdxDAEJ+qG8TqtxokyCtwxAgnZAZ54Hzob8HeNuUJvvk-7MfQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHdxDAEJ+qG8TqtxokyCtwxAgnZAZ54Hzob8HeNuUJvvk-7MfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Op 06-02-2025 om 16:56 schreef Elias Pereira via samba-technical:
> hello,
>
> The wiki is returning the error below:
>
> Sorry! This site is experiencing technical difficulties.
>
> Try waiting a few minutes and reloading.
>
> (Cannot access the database)
>
> Backtrace:
>
> #0 /usr/share/mediawiki/includes/libs/rdbms/loadbalancer/LoadBalancer.php(972):
> Wikimedia\Rdbms\LoadBalancer->reportConnectionError()
> #1 /usr/share/mediawiki/includes/libs/rdbms/loadbalancer/LoadBalancer.php(944):
> Wikimedia\Rdbms\LoadBalancer->getServerConnection()
> #2 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(95):
> Wikimedia\Rdbms\LoadBalancer->getConnectionInternal()
> #3 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(101):
> Wikimedia\Rdbms\DBConnRef->ensureConnection()
> #4 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(313):
> Wikimedia\Rdbms\DBConnRef->__call()
> #5 /usr/share/mediawiki/includes/language/LCStoreDB.php(61):
> Wikimedia\Rdbms\DBConnRef->selectField()
> #6 /usr/share/mediawiki/includes/language/LocalisationCache.php(496):
> LCStoreDB->get()
> #7 /usr/share/mediawiki/includes/language/LocalisationCache.php(542):
> LocalisationCache->isExpired()
> #8 /usr/share/mediawiki/includes/language/LocalisationCache.php(453):
> LocalisationCache->initLanguage()
> #9 /usr/share/mediawiki/includes/language/LocalisationCache.php(352):
> LocalisationCache->loadSubitem()
> #10 /usr/share/mediawiki/includes/language/LocalisationCache.php(368):
> LocalisationCache->getSubitem()
> #11 /usr/share/mediawiki/includes/language/MessageCache.php(1147):
> LocalisationCache->getSubitemWithSource()
> #12 /usr/share/mediawiki/includes/language/MessageCache.php(1097):
> MessageCache->getMessageForLang()
> #13 /usr/share/mediawiki/includes/language/MessageCache.php(1036):
> MessageCache->getMessageFromFallbackChain()
> #14 /usr/share/mediawiki/includes/language/Message.php(1473):
> MessageCache->get()
> #15 /usr/share/mediawiki/includes/language/Message.php(970):
> Message->fetchMessage()
> #16 /usr/share/mediawiki/includes/language/Message.php(1053): Message->format()
> #17 /usr/share/mediawiki/includes/title/MalformedTitleException.php(55):
> Message->text()
> #18 /usr/share/mediawiki/includes/title/MediaWikiTitleCodec.php(92):
> MalformedTitleException->__construct()
> #19 /usr/share/mediawiki/includes/title/MediaWikiTitleCodec.php(405):
> MediaWikiTitleCodec::{closure}()
> #20 /usr/share/mediawiki/includes/Title.php(2984):
> MediaWikiTitleCodec->splitTitleString()
> #21 /usr/share/mediawiki/includes/Title.php(480): Title->secureAndSplit()
> #22 /usr/share/mediawiki/includes/MediaWiki.php(89): Title::newFromURL()
> #23 /usr/share/mediawiki/includes/MediaWiki.php(162): MediaWiki->parseTitle()
> #24 /usr/share/mediawiki/includes/MediaWiki.php(860): MediaWiki->getTitle()
> #25 /usr/share/mediawiki/includes/MediaWiki.php(562): MediaWiki->main()
> #26 /usr/share/mediawiki/index.php(50): MediaWiki->run()
> #27 /usr/share/mediawiki/index.php(46): wfIndexMain()
> #28 {main}
>
>
Same here, the wiki is broken :-(

- Kees.


