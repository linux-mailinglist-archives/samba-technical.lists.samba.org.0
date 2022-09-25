Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FB5E90C4
	for <lists+samba-technical@lfdr.de>; Sun, 25 Sep 2022 04:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gjMCv1RlcJfJkY41uKS8M4GrBwzYREur0qMpNDzoLeE=; b=APGpQ+EsLPwywdrJdPIW6jn6tu
	z93W/27fmHDid4Hf/qfrByZ+TinZyh357a8RNq7DxalezjqRC6BqLZJ1oAbOI5eUsfcVx01XlL5NH
	nXOGG8L56UQtyjkIGIho4Wn71HzhqmL4ak2R6cHnCoBVgQ44ADQsCmC8CcrqAiFsOzOzVLc4isoxm
	iTpaUm/Gatob8fiu95x4BW0AG86Yh4IEX3Btcxm4xJ6t85b6iHcQIF1plZkcHOLLvHwMbC0u4ZQXh
	kXH2y4yiIRzJU+gt381yXM574uDRYU/9qJt7xrHVYtZRqRSggjl/hBd8i3ssy/+R1xH8CGHw3Z4MX
	YBEhGBZw==;
Received: from ip6-localhost ([::1]:49280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocHD2-003z0l-2P; Sun, 25 Sep 2022 02:17:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocHCw-003z0b-20
 for samba-technical@lists.samba.org; Sun, 25 Sep 2022 02:17:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id m3so4796965eda.12
 for <samba-technical@lists.samba.org>; Sat, 24 Sep 2022 19:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mvo+ukAMxB0JXDFRPWdj8rhXBHVcqemeCQ8biJXfT8M=;
 b=ESIANVrQ1V0zbe3hqmacKlFCj/SXIxQ0tjlU2Ap7crfY+9fj/pMkxd24jaicHI3Njo
 yFN2kuc5J2v8AoltOLwFzGN8NvFgRrfICdA9NlKUeN7Fmx989V7qQpsuPOGNNLe+g0Ju
 UdaE5Fqypbrq6rpYYIn2yHB2y9Oy8vTsKiLyRdSASbRU2BDQmv4NS1KczHSMjLaDSGQw
 CgdSWE544KVGa+OoE/GWy/aXi2njeGmfnZX6mDGIaK1OBzH1Np3v59KEr5dNI17oMMok
 zWUMStvguq2jPgvnUK4hwX9hjerS4NN3pir3jqXu1iInmKr10XDXHywFGMonusXobQt+
 oKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mvo+ukAMxB0JXDFRPWdj8rhXBHVcqemeCQ8biJXfT8M=;
 b=W+9uyOq8aa9O28IMOZesuD718X6D/1Fmaq6DDg0Ar57sLTXlzq5+IWChaP8BmIqkGC
 RPQPj0tzCWPjxs7eHS9kSaDc4jcmWsYkGkHqTzdYrj7ZVQKmx6detE63OpUHIcdhurRw
 qSU4UrJkhBmcJP0FpOs3Y7fHhsf7NiVrpK3Tg5rFhB8p1xps4C1b+YsLVYvqc0TZ/ZT6
 RIvhI657c2TfTpjbB6a/AWKMvEoMBvoh05VihIcK01aj36pi0q2nMWy6BZsmikg2DfhE
 62w5UK4cC2o42E+Ie5BEdWGH/SMY9BiG+UcmJvhiR0qCLz4raI9aSSLtWcibgKt8qFw1
 C34g==
X-Gm-Message-State: ACrzQf2zMBD4/k1uXMra5mQe1iNN+1bVLWaB5o1+U8huRFFSmHdVoQiq
 qy+Ns8jIaui07SO+zQIWFSc9gXUo+VenZOWad6k=
X-Google-Smtp-Source: AMsMyM5TRIjZTt2IA4rSYAqpzG4AD/vZ6Oq2a/iB+sSkDJI7G+0Fy5HgyjfwMhsOg054UxdTuh3Vqrz0lBiZd3NT71Y=
X-Received: by 2002:a05:6402:43cc:b0:451:129e:1b1e with SMTP id
 p12-20020a05640243cc00b00451129e1b1emr15960227edc.258.1664072239730; Sat, 24
 Sep 2022 19:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
 <Yy4xsp3cNIp083La@jeremy-acer>
In-Reply-To: <Yy4xsp3cNIp083La@jeremy-acer>
Date: Sat, 24 Sep 2022 22:17:07 -0400
Message-ID: <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 23, 2022 at 6:22 PM Jeremy Allison <jra@samba.org> wrote:

> This code:
>
>          * We're only returning up to 2 addresses per
>          * DC name, so just allocate size numdcs x 2.
>          */
>
>         dclist = talloc_zero_array(mem_ctx,
>                                    struct ip_service_name,
>                                    numdcs * 2);
>         if (!dclist) {
>                 TALLOC_FREE(dcs);
>
> needs an integer wrap tests for numdcs * 2 before
> passing it to an allocation function. Something
> like:
>
>         if (numdcs + numdcs < numdcs) {
>                 TALLOC_FREE(dcs);
>                 return NT_STATUS_INVALID_PARAMETER;
>         }
>

Oh, good point. Updated.

Does the overall approach seem like an OK compromise for now? Changing
process_dc_dns()
to do parallel pings does seem like a natural next step, but is also much
larger in scope. I might be able to work on that at some point, but my time
(and risk tolerance) is pretty limited at the moment.

n
