Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520F23562D
	for <lists+samba-technical@lfdr.de>; Sun,  2 Aug 2020 12:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8B+sqvXhaqI02FIUoqzQZBOgWyqavzRSGjJu5dqGaRI=; b=BBClhFtNOpPlapNZTp2+FR87u/
	eT4DI1w4Tiedon7DtH2v+ogbY7pimPrLWKGLgCd0mJGa680sazrJiegYlFwwAxO9PvUHz8lDGTnUe
	wfJ3zs5YNbZRDomSYaQVzJMj8TkWx+VGVMQXJn6wD+BC2LMhYMH5sTynkjslbneJHVPmLsMpWV11l
	Pg0psVL+dsYcuo5OpVN8gtlrKOMxYXkGZP0QyBVMx+46/wexOE1KZpoCgZ2ofXiSZyCugcr95N/ZQ
	lqx64M2oKBdj6M7ErrESq+otS1I2rlccx3tNDVixag+lzp3Av29AM35K8TCVrYdYeK+yMLWg+drFn
	WQ8s4eEg==;
Received: from localhost ([::1]:35430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2Atv-00CGD1-Ia; Sun, 02 Aug 2020 10:07:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37017) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2Atm-00CGCu-KH
 for samba-technical@lists.samba.org; Sun, 02 Aug 2020 10:07:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id qc22so20872641ejb.4
 for <samba-technical@lists.samba.org>; Sun, 02 Aug 2020 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ux72emXM/rN1PKqX5V3eU7OQ4hMSdUnLdQvHdxZa0gg=;
 b=iLgxHvxyq3viqET9zf5eeSA61a6GKK04XEtb03tXolHthqvFQ+fQ5KjKhguPuh7PFH
 SfBHx9HLLQZrAV2s1VwhX+EXhOAe6MX3uogPsJXzoH1JxoYRENX8ECWkUjw8AmD309sy
 jiTuEpkntdCp4zY3qzaBda9lQ7DyhwSDXJiT+f5IAsq1FAnWvoytvjndXm9CgrAPBots
 RzNYJsdNexTdsMfUysVVhV5Is5L+SiOuh4LbJyTZ2/i89XX60u7uBR2m3w7nvFtdYBDq
 +OI9ZY6elFSmrrvsIb1PWd4EgRTh3PY55H2yq72QgliUwbiDUeO0yiMvCBGYi8koA4Zo
 dh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ux72emXM/rN1PKqX5V3eU7OQ4hMSdUnLdQvHdxZa0gg=;
 b=Gu/QzC3UJmB5kwQiJ4HEcB+WM8+Vq69+8fU5RpxYr94/QDYTnqBI0kxr76AjnXuNXR
 sty+5IwGXqbicruIvd3PqsHTHsiL9gIo4tFun8WSqEQ2qzG9MepT1OLmqPjM9a/3i4Ew
 R1mNKiAtwGuP0uQfEgNG8ih14cTh2qjnd/Z9snIWoKcEN2UFjE8sl2GVPdGjwvoY2DpO
 gjHPg/qQPmjNYEfi3oEw5oTLi2Xx4G00bRusJWivp6z5V08ii0mhKyThpDA09ESKTUUr
 Bq5lOar+TcPAt4olvdsNXYg11fZonHNz2UADCY1ltFqBmSg1euftU3QcxbxI00rZ/71A
 YLLA==
X-Gm-Message-State: AOAM531O0w117IKi3+0Ibe5vzmLD0VvAakEAVZsF60krG6ylxEcjCYzh
 SHAtNet3CemmNWP4e6dWyNkdOfrBcNCSKcUJZ+zZifn3GCg=
X-Google-Smtp-Source: ABdhPJxlhTRap0JzRDEnttCjrj9clwTiPjlle2uTwjnG588D4os/zguuWiWOLweKcAHH8ojo8icXhiyBqUIH69RDFQ0=
X-Received: by 2002:a17:906:c007:: with SMTP id
 e7mr11879170ejz.481.1596362841323; 
 Sun, 02 Aug 2020 03:07:21 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 2 Aug 2020 13:07:29 +0300
Message-ID: <CAH72RCXCJ1ETQNV7Ysxp89jTQtw_ZQg+2HW0x+ouWdwrfsAY_g@mail.gmail.com>
Subject: GPO Get Inheritance Clarification
To: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
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

I'm working on Group Policy Object management as part of the GSoC project.
One of the commands I have come across is the samba-tool gpo
getinheritance <container_dn>.

I have obtained the containers using:
samba-tool gpo listcontainers {6AC1786C-016F-11D2-945F-00C04FB984F9}
(the last part being the gpo I'm obtaining containers for)
and the result was the following:
Container(s) using GPO 6AC1786C-016F-11D2-945F-00C04FB984F9
    DN: OU=Domain Controllers,DC=samdom,DC=example,DC=com

What should I pass in as my container in the get inheritance command?
