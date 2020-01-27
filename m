Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2E3149E1A
	for <lists+samba-technical@lfdr.de>; Mon, 27 Jan 2020 02:31:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IIkhiuZuJ2MlF79IjMR6PwO6Xbf2gO4kE0QNWykV0Ag=; b=242c7CVea9tuVp00iuGh9lFYmW
	n2sP58JNK7DAd6cOi5zCcTRhHugK2rGIWjZBcuZAbB64tpd9b56viwmif9Rb3ofK3Qa/+aKcpXXpJ
	Le44PTrjFZr/KuZzt9UtBFw5HNOz0NKtpxkNCZlQ1LrNZpQ0aCQDyiZ44Da5GtlsHYh4y95PBSvVT
	Grv6lO5UqZ+0TokXRda92wpFxLmWg4q0fbKj/96zKpB9M6aRM5uWFDAvkQlI4fEy3uwECDSHvt2hS
	jbKYBFWlm+8xULO5dxYB0PGVs5uTtfig0Y4aiRTIJaGaC5pcvhI5xpDVVNPalcCu1h5X4B1STTKp6
	ikmLDH2g==;
Received: from localhost ([::1]:25838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ivtEP-004tNi-Ls; Mon, 27 Jan 2020 01:30:25 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:40611) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ivtE4-004tNb-HH
 for samba-technical@lists.samba.org; Mon, 27 Jan 2020 01:30:07 +0000
Received: by mail-il1-x12e.google.com with SMTP id i7so3004479ilr.7
 for <samba-technical@lists.samba.org>; Sun, 26 Jan 2020 17:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IIkhiuZuJ2MlF79IjMR6PwO6Xbf2gO4kE0QNWykV0Ag=;
 b=QDUYAtwME+TcGbchIvdDgrf8AMobq/0jh+WuumV1R1n804QzhinB61zcXsWf2lRBia
 wEOExDQ2lfThTQblayaSvPZkQVNUQlmxDni0Agad6Rt6AQMjwX0LKWq2sIZgk6EEfRYh
 yMemTCw4kr64KnM7/90op1aOkhVWfnjYC/Eo5CQ4QTi5SkKVTCcqWUMBRVYKBPwdyVwc
 JZyF9U8cvAAKce7wfajl05N/oz3G4mfZhg9ReqVwZNLDnmI5j4o8hq4zbmMkfFE+qDJI
 Re7/wWt7oqEsgHqNBDgD7kRB/toiZSfap9CBbQtQSSCDNjrdbgJHUg7EQfnKSyBTfwOf
 ojgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IIkhiuZuJ2MlF79IjMR6PwO6Xbf2gO4kE0QNWykV0Ag=;
 b=qkGzzCa51HACs0Qu4JVzkwKdNKEOKC4vLIPuKU8bWGhQ1Wxc/grggeN47MuPiEtCDo
 dRgYKQAOqj7woBQWweILDmhHZHDKyqcgvxj37dvth9y5Q0uLlkCa601/h2gEc5jmT2S6
 +dQoCjRiCyJFNlQsiWheI9Loq0ZIO8N+ZJRVXsWQWYXBfPhrWoXC0G5Q/78cCm3zSqsb
 h+vTluS0yhvWK74gOZkaFsPR0qgrnmTrC1wkrCYQYMpQGDBC1f3JNn7aj+7KenYlK+S2
 dd8rcCbLvszsi5tgpv6Q/VEvop+2Q0x8FL8VBnJRgJH+4r7eOPVVvvux+h26NO0jF1Yp
 ADTw==
X-Gm-Message-State: APjAAAXBiIjeocPPSx5ilEBOF8ODYVewCiZknxLfVij+VM7KwTgdacIk
 Z34QrruyQHDy1Q/4rOcmbWt8lQQYC2ZVLaNKxQjCzrQQ
X-Google-Smtp-Source: APXvYqyqSlqEZHM4i0gqT/vXkJXxhPDXzkwqyjjSZrHbnwaKdizXv0NVuzirUYnQRzDxWE5NDb7QlvopyowRZC9mcuk=
X-Received: by 2002:a05:6e02:c71:: with SMTP id
 f17mr681048ilj.272.1580088601487; 
 Sun, 26 Jan 2020 17:30:01 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 26 Jan 2020 19:29:50 -0600
Message-ID: <CAH2r5muvULmk3eRAg+tWbqxNXbU6d5dHTg+2akJxsqZiJNGibQ@mail.gmail.com>
Subject: Linux kernel 5.5 released - prep for 5.6-rc
To: CIFS <linux-cifs@vger.kernel.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Now that 5.5 kernel is released (60+ cifs/smb3 patches) and
cifs-2.6.git for-next (and the github tree used by the smb3 buildbot
(automated testing), let me know if you see any patches missing for
cifs.ko that should be in for-next but aren't (currently 25 patches
queued).

-- 
Thanks,

Steve

