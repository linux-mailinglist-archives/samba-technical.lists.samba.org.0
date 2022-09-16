Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295D5BB35A
	for <lists+samba-technical@lfdr.de>; Fri, 16 Sep 2022 22:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=vKPIZKKMRK4PUODznTfugMhr/yeGTV+rrTOdPHKVcas=; b=m7Fv+g11lZBsESObwgPAUtTip9
	XIjhQjp+bP+pOxi+dauaLSAa1WVsh4HBKo95vYBexQgidGtHatmkLtrdAlYI1V+6Fod9mfQsqNZJr
	LZm5d5JHzyJxUmt+vebr31GNWFb0iqO6Wh2FrkVb7H7yIsw+YPT9f9jABucrVZQAe+ZvuATortInj
	pxYlsETacgV+YXLlZABC58gXJQu+Al6B75PpyN5R0w9ldAgsskvz8/rZTTA2nhaUqhVp9JchTvN6G
	uIQzE2GZt16J0O3uuE/3fVd8qdoIYDsjFja41+TZo53ppG21TVezkxG1JIcNRB2Pe/8rGy+bzC9FA
	FHT4oDAQ==;
Received: from ip6-localhost ([::1]:35652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oZHmt-0013lI-QI; Fri, 16 Sep 2022 20:18:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oZHmo-0013l9-IB
 for samba-technical@lists.samba.org; Fri, 16 Sep 2022 20:18:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 29so33115947edv.2
 for <samba-technical@lists.samba.org>; Fri, 16 Sep 2022 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=d6BxewEljdLlwXzzt/w2TQHMAowpFkbIJXlrqxsrHgY=;
 b=fte4DELWswhfk1W3B+XsWeuXTciYBjJajiR4yBYXeI8KPBiFN0Y3Zse0rxuQuOMFFp
 xCzG/dRjX23vFDzX97yGeVMThTH1RyjFhNZxNOTcPFKB8up5Kp+yYk0IwyOi0PpwiEqp
 eFiaWPwBK1YoMYGMiCOmf/Ln/NJeIw6lor7AuidSCkh1UCbbe2f2GDzkIXo4OQrSyild
 jFGiuxUHNFVDCyfdxaMdMbPlR3TUHK5TACUTL7URSfsC38WMhdsWgT/K0/RtURIf3BWS
 mHL1cLRvy0dHbKamBiIexffq4kXmcLVeyd2dsXgp8THv2Fnk+bOyOnK9ajEQ9EXolgHe
 Lrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=d6BxewEljdLlwXzzt/w2TQHMAowpFkbIJXlrqxsrHgY=;
 b=RYyoZhDexQUJSukUPbfR3STCSYK8SzLvPqB/JJUsmLCJ0fG43JrDY7tbwKGLJvg/pq
 D/HxipcJI94ergJKVa9wD9fqdS5S8TM2nP2Cj3kXr1XN2MLj5KhGpMPvhA8vr5n/5Gl+
 iZ/Zef44e0AtFsLhpNpYkxlwK6Fv+Z4buHb6/AJNChhY/IFyMHnViIDTYMv1Ms2XpPzR
 B6f5XvY7U1hN8SL+gmsPBDDlXm9Ll/I9sdpcBLv8wYbzXfSY02ua8EEqn9m7hDX116qZ
 mskfPVXRTDkpZla5r25jqXIyBXWn94vDeaZWXxCPZghy42vPbRcOzxmm5F0DAJi8AhaQ
 stfQ==
X-Gm-Message-State: ACrzQf2CFGaJCp5p9Rlz+VOdpu65iTwBBrI+b/NdhDX2JrMX19x5a71o
 BNW0NhPFebK1CFh5P1024kPHIRGjSvO0xTdi+d5bzoClifd+2w==
X-Google-Smtp-Source: AMsMyM4JaOmq/XPHJbEOyGn/Q4yqPOYsQJuUKHKhVeL7VOca/AN+i+w+UAWJHsBlFkazzPYFW4g1vYMR3EjyM/o6yOw=
X-Received: by 2002:a05:6402:518e:b0:452:49bc:179f with SMTP id
 q14-20020a056402518e00b0045249bc179fmr5338171edd.224.1663359478425; Fri, 16
 Sep 2022 13:17:58 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Sep 2022 16:17:46 -0400
Message-ID: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
Subject: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: samba-technical@lists.samba.org
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I'm investigating an apparent regression in IPv6 support in the "net"
command, and I have some questions about commit
d882add695bbd5ea03961c08ac2c0380fbf2947b.

It looks like it was intended to improve and simplify DNS lookups, but
unless I'm reading it wrong, it seems to have introduced the assumption
that if a DC has IPv4 addresses, all clients will too.

If a DC is configured to support both IPv4 and IPv6, and a client in that
environment is configured IPv6-only (e.g. as part of a transition to
all-IPv6), it looks like the logic will pick one of the DC's IPv4 addresses
and ignore it's IPv6 addresses.

Am I missing something?

n
