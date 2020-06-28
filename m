Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C49BC20C674
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jun 2020 08:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UC1NcIYzRvlgn7f4fI9gUp6glAWlc+36dNdqhThkExw=; b=EkSv0llNXokpVMsxgc1oRtwupc
	SqP3fdG8Qq+/s1ZL5KT98WVO9iNQ9ujCD88qJ/i8YaypKloEChjKTaZQNoJOlvvnpvsJFtdvIeDOe
	Y0ByDZ8B+IsWee1bkpz5ThWyRLgr3EgtaQnCx+DAIPTzcTVvCPWioLoDfrLtB28ZUEi4bbSnarFPD
	OqO4OyQwJetAs90ruiaIzAdoF5RLxVbla4+bBOLx64TnhLb1p49rKaH3PQ+bimgU3j8yv/mT3gJZK
	tNS+V/nDjnmxOIU1EJu8PKCCNCrh3pZoXNGaPiU3Y+gxYUgtLsuuKJOEaG79Eu8Ym3V+JMdySjoHo
	3pjZWVcA==;
Received: from localhost ([::1]:31992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpQgI-002SnO-Su; Sun, 28 Jun 2020 06:20:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpQgB-002SnH-Re
 for samba-technical@lists.samba.org; Sun, 28 Jun 2020 06:20:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y10so13148311eje.1
 for <samba-technical@lists.samba.org>; Sat, 27 Jun 2020 23:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GgRReNm/AuZfqR54HkEURdDZpvmXvix0y+H69Lu3xCM=;
 b=btut6k1jHXVg9G92sxuKRXuDGmP72oAEAPEYstkV8EhoMEgrI4dIyOwIDq6C7IrN+y
 vn+ixIujdMBVaq+013UN68fC9BNCraHfUXZZksYvbltdzOi3Zzwhnwg/uZ2FavdVidHE
 QTRrORuxC/cXp/uZybv3uunGcwJdOAZyYbVGjgDakYdFMy90w90VcvNfuzccFg986WSm
 0cvIzPchOZxlIm34t+0q5UefykV6GM30OyKbXpXKX4p0eIRDaFv/9JDnYy8Hfu+DgXio
 Ip+bpEjRMmsNpt/vsde8GCQg7PL1waNNQzFMiNutfX5ItJrqrT3l4Wt0pnv2Ziq0By3m
 qTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GgRReNm/AuZfqR54HkEURdDZpvmXvix0y+H69Lu3xCM=;
 b=StB4JAxnVDqWbEw2wJev6gVy5iogDQnfmD2PRk1WDL3CmORZHYWZnzkIaN5+4dvbI4
 I8QhVdnNinqVKKkTnv1+tGsk5G/EDDaATd8QZJihLUK0UHk3MrEZs/Luzzy9keZDK46R
 QbZQq7x1OpwdzuGd19o9BLNrjVhT3AjYH/AfIluHS4aWBYiRScq/RXstEScScAF0n60H
 jxcQY5tm4upLQ1woWpB09OZXpo6dQGx5s9RYj6PJ4ythlLQv76UHGCz4SAZ0GsEf9kzx
 xN2wnOWX1grrQZWjV+p+7cFu2KF/FVxPOD8Xso/Zy4/e0goSr/i98hXROy0O5OYTOR8o
 kGCw==
X-Gm-Message-State: AOAM531bU181cwqTmvcmO8TM1Gag4oUodkoJunI9AFIq7CmSQt0P+UPm
 l4NVGE59s6rBNngE9Z0OIJZMNZSxNlb6PFhcWKN4eyWSQ6k=
X-Google-Smtp-Source: ABdhPJwEA35U9fMjU9UUzMRRi7NwaY2dcOi/8oJFMpEdwaifH3ItALBBgK9+EsKY2xV9g5uEqvvrbo4rqbufrqIx8Jw=
X-Received: by 2002:a17:906:160f:: with SMTP id
 m15mr328506ejd.423.1593325239071; 
 Sat, 27 Jun 2020 23:20:39 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 28 Jun 2020 09:15:16 +0300
Message-ID: <CAH72RCXajQj9ZgOuLphOmY8MseOZuXdUCTtNTKWWKg=XGRXAsA@mail.gmail.com>
Subject: GSoC Week 4 Progress
To: Alexander Bokovoy <ab@samba.org>, "abartlet@samba.org" <abartlet@samba.org>,
 Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

During the week I worked on the following:
   Forest Management
   DNS Management
   Group Management
Repo: https://gitlab.com/HezekiahM/samba-ad-dc/-/tree/develop
