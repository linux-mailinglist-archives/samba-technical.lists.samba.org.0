Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2FC6B2036
	for <lists+samba-technical@lfdr.de>; Thu,  9 Mar 2023 10:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+5rkCE3QWNU4UsKYEoeOddLN5KMwAl6y5FkzDeYysr4=; b=XgXzn2cDybX5qeRptDIh7+WCfx
	akXlRyw3I4cAmBgnspz5ukq50oVQR904Q4lPcpTZnoxgDEUy3seMTpJI2ru21F17iJwCe0RQgouwE
	KgJ3wk4Z3Is2/px/Y3Crhp3SNlwOd5CN3n1uLkwtLh6CJuYL2LKMWtegkPSTxDwC/xi46AflGlMC8
	g+rfUvpoC/96FrJYrsdEYIWGQOavfZHhdCYiYWAcLqkwHRsqLAF/V3UhQebyjJ2JEJmS1L8Imzvi3
	s5rHcXZNsSX7tD/QMK2lQFLDruc48mZPp/IvoO4pHwiuDKHgb6xFn9KrLnMwYRbvUxyL81Ix4m/+9
	kQrxgyew==;
Received: from ip6-localhost ([::1]:62054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1paCgR-000dqd-54; Thu, 09 Mar 2023 09:35:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36783) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1paCgM-000dpy-8N
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 09:35:33 +0000
Received: by mail-ed1-x529.google.com with SMTP id da10so4495922edb.3
 for <samba-technical@lists.samba.org>; Thu, 09 Mar 2023 01:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678354529;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5rkCE3QWNU4UsKYEoeOddLN5KMwAl6y5FkzDeYysr4=;
 b=DaIFxo0Z4h4Fi3BjVFVnforW8TSLGuHHYAUtsSbk2vyc2J8FMuXkf4DlAUOnkDF1Eb
 sITzw9xPv0Xmo75LqiL/oi2txaGy9nI9YYEigliTo2V+5PkY5zjGN1SxoOs70wm7L53x
 0YBxGzQlJkeWhtReHyjlklS/8pTlbMOGnbJ4XITHfBRJCK4vmN1qP69AID8I4m7hJOBd
 N6Ob4o5RnIcW28Z22ob1FndIyV84UFs6GDHQ59e9blCDac42tK5ttipoROYMWremDYZv
 9QJlkoJuZUtkNBA+90SHcl2fEs+uE962jlp0wm4jXa7Mhc31YOzBRpHoPvJgy3MIUGSz
 ssLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678354529;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5rkCE3QWNU4UsKYEoeOddLN5KMwAl6y5FkzDeYysr4=;
 b=YCFByISum++wHGQkL0I7C3cpPYWEMb+XefiokeghqKVGZzpCWpa18sKc9zciFrlZSw
 VxoP4GvgHIzQzCe/DDPhnF4dJdozeT3XHZcLVHMwkzMXwn1n/ECWQqJCUWD09SKLdQvJ
 3lgq0w0C9LH8Z1Ru+7anJjht4wt82hgkd7voIm3Ixi/u2hGenw0od6wLz0cYKuXI5ii7
 hmAZOTe+1hVmVzvJEkyo3v2f/h9kyIr9NUi9/2fmJoVbXV7bUoAjMNqgZ+LTKddtG5yL
 hNQ8ixbd7LCKuD7dHqt2LjnIGl0LWf7x+M84aUUww+3Nr7U3C6YNIopAcQAcda0RSFma
 I9sQ==
X-Gm-Message-State: AO0yUKW2KCFJIfjP7ICt5CuhoHXmENSzXz32e3V8uhdGEZVXKjlFbuHK
 qo6kj3Njq6s7ZUP2r+RYk7nZC/h2DWU=
X-Google-Smtp-Source: AK7set8tCwvguU4txBdwazqLc6JU1K8oIeL4gIIt48FP9GhZgkSTTH6iGp0bfAu7gxl7PH26URK5bQ==
X-Received: by 2002:a17:906:68c5:b0:8b1:353a:2636 with SMTP id
 y5-20020a17090668c500b008b1353a2636mr20318947ejr.14.1678354529349; 
 Thu, 09 Mar 2023 01:35:29 -0800 (PST)
Received: from [192.168.10.109] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a17090651c900b008b2e4f88ed7sm8647339ejk.111.2023.03.09.01.35.28
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:35:29 -0800 (PST)
Message-ID: <df994c11-dd59-c0a3-6385-e417baeee751@gmail.com>
Date: Thu, 9 Mar 2023 10:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Release Planning 4.17] Samba 4.17.7
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <21e36051-d0bb-e971-d8ca-1cab3dff65a1@samba.org>
In-Reply-To: <21e36051-d0bb-e971-d8ca-1cab3dff65a1@samba.org>
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

Hi Jule,

I guess the date March 9 (today) is not correct for 4.17.7...?

- Kees.

Op 09-03-2023 om 10:31 schreef Jule Anger via samba-technical:
> Hi,
>
> Samba 4.17.7 is scheduled for Thursday, March 9 2023.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
> has been updated accordingly.
>
>
> Jule
>

