Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E2F375091
	for <lists+samba-technical@lfdr.de>; Thu,  6 May 2021 10:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Tkjf7nvBc1tkn15DiHJk/fiZ5nbUCqyt4jc/hFH57TI=; b=LSYDeJBQQqqpDkxErV+br/ABQ7
	hMbFtAc7LKWYRnj7nKucpGrSC91IACGIuZKQoJmdJxby/PWTC1hKIDPs+OvQgS3Ji34wDZ4jm5wHA
	qrjsL3cWdo90Yxmg7tEdiUjYTxSQQxjfj40CyU6a7CILQ/efBuClh00sTALwASl1bIelxUsgPJo1h
	Txo+n/tfaxEQ3bOkV2lj6rzEzSxk4T+8ha5M1pnVW7tFGB6941MbZH5AbP7n5KAzAqWKVHbgKoZ/M
	y9HdVo+PZpVNOihNq3YX8RIUx/lBJU7d8lTx3o2IVK52usyMqrP2LTK1sDRhGJVZzR18U3C+CnuMw
	P3U76Kiw==;
Received: from ip6-localhost ([::1]:44606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leZ4j-00FgqE-T3; Thu, 06 May 2021 08:09:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50745) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leZ4f-00Fgq4-EE
 for samba-technical@lists.samba.org; Thu, 06 May 2021 08:09:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id n84so2873059wma.0
 for <samba-technical@lists.samba.org>; Thu, 06 May 2021 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tpiMJPso41+PhfjVzRu6O5LYHRNiVyUO1fU00W+HwTU=;
 b=VBrj9COP6cMugmpsTtiZ4clJd0D3iMVI5pQl/iZiR33ebsNSggL4mnmP8JAY+DX8AR
 eHTfSLFVeccdQIFDtXGhk8F64PbKZRTe+5TWNjTJh+SMtIdekxWq32/bYDNKaO5bIsAp
 YViHPZC/RLwbykhU0xGngXCbrO4eKpORV6SzkeymyEeTOF4e3VKFgjpBuDacEg19mYzE
 yghs+fnuP2lt87JLi+zja02mY1EvydqTSUfPtMzD7/eJ+sgLm8IrIrCZdOht4TSLvumg
 ukoulmhL9J1ny5+DaCqk+TgJTlu3SRrKfzGkn5ihHWauF/nfiWTeN8nZBHIFO8GJNEZq
 hn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tpiMJPso41+PhfjVzRu6O5LYHRNiVyUO1fU00W+HwTU=;
 b=LGvkQdvLKBDv88cR6yNNsQrg9lc04RkNvDr0dumEYwb7lOqS631t10zogUPiFuI7oL
 qCtV4uaXjvbiLuEJKbpTPiszCi47PCbax1B2Xwjq5NFF9gSh5TEuvX93kKREaBcPRiWM
 A1cMgng1e380p2g7F76LHvZ+QEtPcv28xrAzWTiYHW7uc+SYl4wrx/rlF1ySmOrq9onj
 OkjQ0XaqiFt+ZmzTjpBhYRBbphhH5X/yeZet7Ycz+RUfFlPgrKh/BCwp42GfHCU/84sk
 eSTJ1mT6EzQeUl6KRaZZqUlbfwQMm8wm5HK8U9RvSQxcJgDjjQKcww1DhevkMxgV9KSw
 FSXw==
X-Gm-Message-State: AOAM531Cw6ypiXmk6BCmjTGXhZZy03y7X5W8Wm+ViNx3qZcEJMcLE6+s
 RtdEUtWsGzbsQv5uxXeLZc0LZkoxCKuToORJuYU+KKzoA12Tvg==
X-Google-Smtp-Source: ABdhPJzVAYuw5A4o49ZPBnCJQHr+SVjbUvRiYFnMd8QBIpuWxVXVM4ELCKD4msw9pezEsC2ldbhJseT+Fs4ZM4q7SuE=
X-Received: by 2002:a1c:1982:: with SMTP id 124mr2680111wmz.148.1620288571311; 
 Thu, 06 May 2021 01:09:31 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 May 2021 13:39:22 +0530
Message-ID: <CAHbM3qimekkP7JJDQ=_3ztPKRRW4-rGEVb53noxV9pgSiFPuDQ@mail.gmail.com>
Subject: Contacting primary domain in winbindd trusted domain child process
To: samba-technical <samba-technical@lists.samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

When a trusted domain winbindd child process is created in
fork_domain_child(), we try to bring both trusted domain and primary domain
online. I noticed that the one place where we try to contact primary domain
in trusted domain child process is in get_dc_name_via_netlogon(). Could you
please let me know if there are other places or instances where trusted
domain winbindd child process need to contact primary domain?

Thanks,
Shilpa
