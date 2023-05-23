Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 730CD70E79F
	for <lists+samba-technical@lfdr.de>; Tue, 23 May 2023 23:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8wIZSCQ8edYhjFZ+60ckyujMxmrvzH8jxmNqi1okaVM=; b=L62vXepZY7VGr67MC6EC3/Awa8
	BrTLHOCWcO6mQuO+TKcryS3mP4uLw5rs6xr7idi5Q0JWHwANd0Y8tMpDNP8+SwsWDYADsJeMYGRyF
	evmb1mUCdgdhLzEMEDNdPkKYECEFqcy+XD5JK/+Uew5/RDyCIlha4ohrfWRC1x9Dnjp7+KuLWKSKV
	6+vYzI+Nz6+Iml7LFozw+Dhv1rYdN5WSDYbE3n/uSXicuRIFw+8GnhEEieZMThngsYTelo6tQ24wC
	uXvw1K8w1udYz5qyWIJX8w4L0YIMyzULvKq9febImF4gjwkNWrfO2bzMDPt7c54rweuCCpYRBK2xj
	QhEPC0rA==;
Received: from ip6-localhost ([::1]:20746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1ZoM-00BlGz-PE; Tue, 23 May 2023 21:44:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45489) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1ZoH-00BlGq-RL
 for samba-technical@lists.samba.org; Tue, 23 May 2023 21:44:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-513fd8cc029so675923a12.3
 for <samba-technical@lists.samba.org>; Tue, 23 May 2023 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684878289; x=1687470289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8wIZSCQ8edYhjFZ+60ckyujMxmrvzH8jxmNqi1okaVM=;
 b=e/GdEeOEJsY//5MQ/xaJHDvgLsxvC1Q52QEdUm/n9PlkqYc158HieNZiwJSpBhOesA
 8x2PU9LzAGrJAAmR/3Eiuug3CvNisa9MtM3EsXAOQCleQRousmpOraR1I0QGXcGRx1Kh
 eYadhC9J2RwUhlJoRSGk2gh96k8v2sTC2H1li8eP6+YpvTfwuA7i0cXcV2siOUL48Vax
 QqjtR8FUQj+Q2DvDb1ImjoGK5PLMQADiGUdl0+WzGjXMxTGfE+pRveuckZNO9vI1kNKX
 kqdTCBpDH2tZhRv/g4XvlvT/xYwxvKUsBGJvEDeZQxDeqRK1eMENwVpbo/bv85d9MQPI
 qPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878289; x=1687470289;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wIZSCQ8edYhjFZ+60ckyujMxmrvzH8jxmNqi1okaVM=;
 b=Trkwt/JmvAVsCvPKCxK2P2vQWV2Tm7kTaiJf75HMJDz2J/0aX97504tQANigXGrHeU
 Yokqe/B5TJYwP7NfUGaqMbz4qrPT2C4I8SeV3Go/v8lrAfVOQFnPgZmoGCGETTOwmQUS
 wBhl9Q8kKZPrU3ZZ1KrL0DiWvnloaGi5WCa9lBDMNFSapN/XhkUtAWuk0FTTi0BcXHj5
 yGziY3V4IaoyvGML45o+tA2+qyClqhcRJbpTLoF7PvXnRRyOME+pl1/lWapva4XtYyDB
 AetlkyW4pyUzaZu8YvMgKRAR3sjAxZGKfvDe7f12m2cy/iHseASzdd9T8ue1X6DAcWpX
 Ydwg==
X-Gm-Message-State: AC+VfDyDGUBX9er2EAnA3BuDYtSSrtKhiI6iEM2v5gQv2sXB5ZVdb++u
 HPskYmDvk1mj7w01idjkFM/BYrrt1csEItpQCuU=
X-Google-Smtp-Source: ACHHUZ6LFhG0r6xBndZvF+/Yf4c5IOH7uL8J6uEefVhtJqDEVnkJJytAnjWJQGt9ks8h9RiJxb7NxeUOUSRTSo7lroU=
X-Received: by 2002:a17:907:1b24:b0:969:b2e2:4f29 with SMTP id
 mp36-20020a1709071b2400b00969b2e24f29mr17580538ejc.53.1684878288553; Tue, 23
 May 2023 14:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
In-Reply-To: <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
Date: Wed, 24 May 2023 07:44:36 +1000
Message-ID: <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 24 May 2023 at 02:25, Jeremy Allison <jra@samba.org> wrote:
>
> On Tue, May 23, 2023 at 10:59:27AM +1000, ronnie sahlberg wrote:
>
> >There are really nice use-cases for ADS where one can store additional
> >metadata within the "file" itself.
>
> "Nice" for virus writers, yeah. A complete swamp for everyone
> else :-).

Viruses? I don't think they use ADS much since most tools under
windows understand ADS.
ACE's on the other handd.
Which reminds me I need to write that tool to store/retrieve files
stored inside "hidden" entries in the security descriptor.

