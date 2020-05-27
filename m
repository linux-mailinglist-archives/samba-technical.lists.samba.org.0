Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5E1E4DDC
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JRQGL613UJjOY8ZLF2qYuYRM497uTKxKi2h1IUEWodg=; b=s0BR0R2n7q40Dts3yIB3P0Nkni
	WooeepdKMXne1qCM9CGiRRn/wTY1q6/yySfVpsXDDRi1X5GgPyIvF4v+1Ln3eaRIZJB7p9UBJsB2M
	gpRhTjRxZGBgVFgCM2y9xRsypl4fmLjZR3GYSHlEdnIUQnljXupyILOOyxZ4Hnq4IBZku9OLX04Gb
	1rSc7RvHym2L+3zrj7HTwZzEOJIRFBu94HFk/LySuaNzXtjtW1M71aHMda72FBs9Iu5JgYt3IPvZ+
	scYxvtSSGE2kbDf2aGPV6ojS/1cbTrRj5DYZmcVbtSOKfHnyNXdCQhRl1y9OGzdGTEe4aCt3PIjeC
	+nyHi9NQ==;
Received: from localhost ([::1]:63474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je1NV-00654j-6q; Wed, 27 May 2020 19:06:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:36146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je1NP-00654a-Qk
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:06:09 +0000
Received: by mail-lj1-x236.google.com with SMTP id a25so18672496ljp.3
 for <samba-technical@lists.samba.org>; Wed, 27 May 2020 12:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JRQGL613UJjOY8ZLF2qYuYRM497uTKxKi2h1IUEWodg=;
 b=Vr+rz+Sb/EF/rE+chuakcm8epbtczaRjSPUxqHpxWKjvGPnozJmMaOBRYt+WjUXQFO
 6GEc4V+WWSuiTR3mcHySqKBQ+xLUD0cQ1K83XaaABkJRBPvDjPFrctud8w1emPxOLQfD
 kK67kPXpcezL/4TqV+rEy2eN5/GcrIGkqQRBtYAz0a5XC5vdIdonaQHmhtdUDFPW0EEV
 1bXE0XBHHpYv3PUA91Bj2QPL9XFvzP6oA6sQE5UEQELNPKxGP6oz397gdkIdBr89IT39
 pdlCB9xx3bkBdm9F3/xncwPKtdJ4OVsuLTmRk+B5PFFbgWbBqDJ1boqfIXyCO+UWTvaN
 RoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JRQGL613UJjOY8ZLF2qYuYRM497uTKxKi2h1IUEWodg=;
 b=C0cp4NbH5ryTCXg2GjltJfbQ6ggBJERpOYA+dKBpqFffbaO6n7veGf48ykckg6MhrQ
 sLVB8ped/AYueJC8e9QcSSn2piIDJb7g8UVbtFsjy61hB1wXnGnzdyjhiWAbaoesZweX
 BWtuuEoEUPEnz5j0RAzWRusFWynQhIP5jrJwnNHJjIY8miZOHgSxiHlCbRW+IaQoKmI7
 hVy1NJI2bjB/x51M+43mU/kcet8XPod7XOuQxAGyPavyL51wE+3yC5kBIqXaSmqEqjRt
 oibAUAhn4ZHbamihZ1Vr3VdbYmEYkIbFImByXAf3aLHqpxe0rwknMV/rSQ3nSUS5ZHhB
 IEiQ==
X-Gm-Message-State: AOAM532KOYkmaz4odeOHt9a+hcHhP4Gajr3queAWgZbOrFoSswLQgIn2
 DpQ17x3LRmZQWpabB8kge3+iDNM+HyK72v/0DUrxXA==
X-Google-Smtp-Source: ABdhPJwYZ/cm3x31nPbyIcH8m4vdmMqzQsOLTrFLG32bx9Tiwyam3Qo2zH0NySJIsfnR1CU6aSbEedQ/0LxOGaMmT8Q=
X-Received: by 2002:a2e:9a19:: with SMTP id o25mr3931422lji.40.1590606366904; 
 Wed, 27 May 2020 12:06:06 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 27 May 2020 21:05:56 +0200
Message-ID: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
Subject: Kerberos features talk at sambaxp
To: Stefan Metzmacher <metze@samba.org>, 
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

Thanks for the talk was great, can't wait for the slides :)

I don't recall a problem with the enterprise principals in old
S4U2Self padata, but I mostly test MIT client, I'll give it a try.

Isaac

