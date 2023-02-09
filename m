Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C369116E
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 20:36:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WY1X/c7e5Z92+OMmg4xbOvYoJirbhLhMQkOVuZxTbAc=; b=zZrpsKH2xT4Dh9c/uo5MaIFn3X
	Xd4jhkbzLVpn44OZrgbfC/wgRmDnnJQzvJz2I/dJVPVOSGLtaSrl3emTkSCDtTnQp+zsiZLyfIcPp
	NyAXsupoTU80i69jtL+m0ES+CSaHfwLkL7sNCq4+d85Fq6WzoZsbgl0ZhiHSStP/1QiHdM0BH9wgY
	F6PFpoorBuJlRv040/eYQTikIu+BMUmIf34/d1PTGkLBuQgLRVbV4TxUSYFjSP88oNkCAEXp34+VK
	yAJpf+cVnXRaiOlcx3zpgXMESWzJvBNWHBlCBmyqx+CBMwwYlQJ9r5ABm7nbTph8UrOSYHEnQAdhj
	OMeq9XTg==;
Received: from ip6-localhost ([::1]:57610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQCia-00AWbT-VC; Thu, 09 Feb 2023 19:36:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQCiU-00AWbK-RO
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 19:36:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id d14so2887343wrr.9
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 11:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WY1X/c7e5Z92+OMmg4xbOvYoJirbhLhMQkOVuZxTbAc=;
 b=HpNataVxmxBBguwOhOWdkBLvuG7E72utIRmGrRWfumQf/7LSHKz2DmnbWLl7i7CwIa
 kubb6cZfJqtTPz4iOILzRcOsFWYWstwg/DAwK0/5WnU8e6BtpUALpxd611815udXP0Bz
 pHSLnZDLlYJY0wrv4dfF/rWX7DHdrmcoWXY5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WY1X/c7e5Z92+OMmg4xbOvYoJirbhLhMQkOVuZxTbAc=;
 b=KYjQza+TnacoFlax9XWuunjvd0ev2bQ0LX67u1OK11CVU0geP1SN148IZwUi7qB6Pr
 daJoFWgSA+3jsqSjck5S3F8IGC5uySKf9DF+Utt84JboYocV1wnI9ILvDpzDn1JVVIuI
 iHKAFz4BE//T4lBWNLK+xV+xBupEzMJO7RLHEdi6wAnk/7imuI/E8wvbl+v6ngGEBVXM
 KgxX97QmJE/LImAwmPTF+aUiIx0CHetecKkMz7Ur0hDStyb9blm7QMNUsPR2lyHzBsig
 OTC9hz+XfYUO9pxqkzQy1ZZD5vWKbZ9laffKGC+/lzfzkBkivZAcUIKCziewIZydFHP0
 MbKg==
X-Gm-Message-State: AO0yUKWixSx4H9gl10lr+C1n3lVWsm7vTRkdGrwOyLaTN/IvQzafP4zn
 FVix8AFRVPWlGUdWFmYKLjPkiGL7ePHLNR3bu8g=
X-Google-Smtp-Source: AK7set9nR92YpVF4rnsDebi0axtl4gPN1xjr5gj5KJ9g33KYDeYXVkyNCPcG+OTWmMZp8mVX3jDwxw==
X-Received: by 2002:a5d:5341:0:b0:2c3:eaff:aaeb with SMTP id
 t1-20020a5d5341000000b002c3eaffaaebmr12182191wrv.21.1675971381515; 
 Thu, 09 Feb 2023 11:36:21 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b002bcaa47bf78sm1930783wrp.26.2023.02.09.11.36.20
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 11:36:21 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id c26so4849339ejz.10
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 11:36:20 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr2445413ejw.78.1675971380625; Thu, 09 Feb
 2023 11:36:20 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
In-Reply-To: <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
Date: Thu, 9 Feb 2023 11:36:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
Message-ID: <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 9, 2023 at 11:17 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> Any comment about the idea of having a preadv2() flag that
> asks for a dma copy with something like async_memcpy() instead
> of the default that ends up in copy_user_enhanced_fast_string()?

I guarantee that you will only slow things down with some odd async_memcpy.

There are zero DMA engines that do memory copying better than memcpy -
the only way you can do better if is the destination isn't memory in
the first place but the final device, and then we just call it "dma".

                Linus

