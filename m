Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67B78E24F
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 00:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZvEkz9FLSpvAhQSNY0kZhCILeZEEmYe1PS2jc/K2t/8=; b=GrjzNHX+vM2/AoGRoa1zB0mLCY
	OFVs5yl8J2aFnUbd4oIlXY75Y4J0cOeJirLAJJ4uJl2q9oV954CLV1e/chIBR46srt5IAxk5mBoTk
	diEPhTUrf+FATV5NyyOuFWa0gNYWdsnhoNFVr10GT9luIrtuzLATxzYAD2Fvy9ibv3zJ50hFZJgta
	d1VogZKvjOVpYn2PUumz2SSIceLn0awQT4+ztlDq3oz8bBOKPD4l3oKjhsiNVrWk7b3bJFzj9At5T
	Pgjq/R58DjG4oDEf/AYzmRF0UTkKQ7DwdbquwibfJxokHZTaeUpZAU8Tw6MHsye+TNQHADLouiqaB
	vJQD1vOA==;
Received: from ip6-localhost ([::1]:59090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbTgG-00FehI-5R; Wed, 30 Aug 2023 22:28:56 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:60527) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbTg6-00Feh8-2N
 for samba-technical@lists.samba.org; Wed, 30 Aug 2023 22:28:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bbad32bc79so5587561fa.0
 for <samba-technical@lists.samba.org>; Wed, 30 Aug 2023 15:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693434525; x=1694039325; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvEkz9FLSpvAhQSNY0kZhCILeZEEmYe1PS2jc/K2t/8=;
 b=DRn3D5j/TD4Az0BCYAow8WBIDFolfgjEee0VTylDG/hVzoqwaItXjxb+tWlOSvvWC5
 Crz7pdeFsEmHmUm5zPMnEjyD1IhqavSjdUJ+qF0OJsEdEgWmsr1L6F9zSh3pPs82xPUI
 rh9U/PurhP1qUkjwomRwiY+M3p0N3NFoHhpKxh9LVMig2cb6uZI45PZSMKxTOUgQK0kF
 KvEl6vUxr1ZsHkK8taDhauhVTYwPgXLYUemjkbH4Q8t/aL6seRYPafjmzDy1KNYK9cU/
 zMuyh7LLnlFf3d87af7kal8HPvWgDBx8oVk1oqdppLnyy72xwE3RAKYMQPjAQb1ogpVy
 CXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693434525; x=1694039325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZvEkz9FLSpvAhQSNY0kZhCILeZEEmYe1PS2jc/K2t/8=;
 b=RYMe1zH4OqQVdjH2mIG3ZbQg4vB99lb5CelmWXTFmjjg8vnHtOpD1hxPoWuAetEjWb
 ke9hdlpyWpHSAeuyYJsWbrMab50Pcjbyzl9NmPxmpc19+xaRMZHcGU2siLRR1OTYLH1+
 Kha+Me5N6hKkFw/HHVGPbziW9l9fuhBQ9jVBTp7ODDwQplOve+eIFOylK/X6GH0Fdw6r
 MXw2MqArtMhW99VG3FTk66+VZQcEVK9SueNr/ZcpK0KkwRDut0DySv6VmFfvGybGSrOP
 dpqxfrK9S1bFFiGgoYroX3AsMt1cbK5OzU+NGRFeu/gfuwjXCkfN8Ypg6rmZ7dvcd+w8
 ymBA==
X-Gm-Message-State: AOJu0YzKxGrn4o0EPP6QhQl0EfSegDKvAVgzvko2Z2x5cx+lhIPMdlbI
 OHbjI7/sL2OybImOzOrEG3gLXp2IxeCaipueiaan/yxM
X-Google-Smtp-Source: AGHT+IHix3kUeW5jOQ6wbczkqSPsoYWLiDspTvN9hKe3S07u1tMmI3pMl4YmR3StvAmrGCsSwUv3K/ihruoRKeuKLX4=
X-Received: by 2002:a2e:2c0f:0:b0:2b6:df71:cff1 with SMTP id
 s15-20020a2e2c0f000000b002b6df71cff1mr2442027ljs.52.1693434524643; Wed, 30
 Aug 2023 15:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
 <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
 <44cfcdc452be42ee85a277c6ead6c7e06a59263a.camel@samba.org>
 <0e661725920d0ba58d5302d68354271cd5f929e8.camel@samba.org>
 <CAOCN9rznGkBr8_Q4J4LXfam4RTN=O7y0Vh1hoNQac+m6EvwvJw@mail.gmail.com>
In-Reply-To: <CAOCN9rznGkBr8_Q4J4LXfam4RTN=O7y0Vh1hoNQac+m6EvwvJw@mail.gmail.com>
Date: Wed, 30 Aug 2023 18:28:34 -0400
Message-ID: <CAOCN9rzRvmu5ZZHHuRSDMzUEtWObP61gH68izzVZnAeCx37=uA@mail.gmail.com>
Subject: Re: samba4repo for Amazon linux 2023: Any notes?
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In case i wasn't clear bout it: "mock" is not available, as best I can
tell right now, for Amazon Linux 2023. There used to be an out-of-date
one for Amazon linux 2, but I don't have access to those hosts right
now to see if it's been kept up to date. It is one of *my* favorite
tools for getting these builds compiling at all.

