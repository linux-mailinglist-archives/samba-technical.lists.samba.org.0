Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D533B4F83
	for <lists+samba-technical@lfdr.de>; Sat, 26 Jun 2021 18:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=NLmft7BFDAw89nJTJt+TFhz0eJX3OVF/x/Zcwe4/S24=; b=CKkRKxxKa0TZf7bKaHP4zqjj8H
	7svHDf7xGaLBiAOKY1fjX9kFZg8s2/aoPlPCPHoFmSVFEgkkeVbnpeZci0jBDlac+p2Mut64K94Ol
	qHw44hb73pnXsSAl62E7HgUbre5zevulf/aymr9ayHu7TkKWAFP2rOXaYUr2Aq3f2lL7dcHGLK6xZ
	tqCNhLKGWFOyoLK+SpcFzIF/xJlxYOg4zQ+WixAzB2NAxZeXWOFf9gBQjSBeoMjR8DgD/NsIAjY1H
	+YqXTbmaiA8BIO4cFsdBsFSZLGIhTfySNe88byZKuOk3aZ6uHbqvi/+fe6iwQVThN4jrfgBYp2P/B
	QQjSwzJA==;
Received: from ip6-localhost ([::1]:52570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxBUL-008at9-4S; Sat, 26 Jun 2021 16:49:01 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:37379) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lxBUC-008at0-DA
 for samba-technical@lists.samba.org; Sat, 26 Jun 2021 16:48:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id q16so7989576lfr.4
 for <samba-technical@lists.samba.org>; Sat, 26 Jun 2021 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NLmft7BFDAw89nJTJt+TFhz0eJX3OVF/x/Zcwe4/S24=;
 b=cDWHscMkkZhgrksxgNX7kF5+px69aJ0K4fxxC5YJjxRONbFTVPZljkRniPlkmR5LeQ
 tD+jPpf2UyDIFs8BY+xOr29ly8oJ5rQZJGe0ZVDa5iW36VKoshjH4c699CQGw4lQKTZK
 qRC5IPMXgPNsW6Dt0ncTigehXGY3RlDEzmV2E7oHauNIklDK7/TEjrr3ilmdszaIJ7aA
 ncofH08taGaaOCaeYL871Ad303KVUxUEz+PlkpSpSwjLQ/LrjoMuYF7T6tbovTipTSzn
 K+mGuYaJzq8ZDkBDgxdiusD6+sA9IiEkhFfsLjvlX4SF4uTRmE3AiWjDLnKWfTZ/Hiyh
 bUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NLmft7BFDAw89nJTJt+TFhz0eJX3OVF/x/Zcwe4/S24=;
 b=JnmR2y8MIdad64gTlxTdhnUzk0b2PL6X0F3+KXW5LRy2IJ18thC3vzqoGikGofk4yg
 XYOvyKChIqWqhPRrGzS22SsJ578oMZbZwOO4hLmn2HkMcD/usj0Fze2JxdreqdFi18sS
 SmLLF0V1KXD7LOoga2WCqWqJ6E391xEgohMEvKA+d7Mv1ocsW8ykM/ZcUXCkJKxHSDWW
 q+foKq6OUN8tIJMb/G7mmaeQ3Yv3KDluK99boT+4hg8WdFNczeo3Wa7VyDx6Dm56YM9k
 V+u/t+16q8NGEgkz79/RS2DJuHtp4Ro5baB0EhXeXzX3/f0+FtwUX+29KYw3t1MWO3lv
 Xn+Q==
X-Gm-Message-State: AOAM5309H5YBIzBNs2Hu6zlCYyav2geG3Q+dyW8sd+mRjRnawG2DryZm
 Z35bCVpP7EqdOosg6Su5zdOkOzfWPCFK4LCmSUVUYzvB0Oc=
X-Google-Smtp-Source: ABdhPJzUdQLQOfTPk5FAPKMoDsQztklnlX3KZCNRAOLYy+xCPQTfn9vDK0O1q52Bt20P9Hungy79R2WhD9q3WEIkn98=
X-Received: by 2002:ac2:4d8f:: with SMTP id g15mr12204567lfe.133.1624726129635; 
 Sat, 26 Jun 2021 09:48:49 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 26 Jun 2021 11:48:38 -0500
Message-ID: <CAH2r5ms9kX=kzHneUkRXOQ-McbRxEck4uBVOQmjHq6q0rhGTCg@mail.gmail.com>
Subject: Signing negotiate context
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I tried an experiment to Samba 4.13.3 and also to Azure sending the
new signing negotiate context during negprot.   Azure ignored it as
expected, but Samba server rejected it with "STATUS_INVALID_PARAMETER"
(it wasn't obvious at first glance what was invalid about it but
perhaps Samba wants different rounding than Azure).

Has anyone tested the signing negotiate context (e.g. newer Windows)
to Samba server?

-- 
Thanks,

Steve

