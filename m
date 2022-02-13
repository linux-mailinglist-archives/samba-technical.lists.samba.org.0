Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D061D4B3B03
	for <lists+samba-technical@lfdr.de>; Sun, 13 Feb 2022 12:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hktW5sqUtbV3R1+cHk9FgUOa131lqqfxd6WcuVxMxiQ=; b=aD0njPbQ4eZluoBf2MKvjgO8zk
	ZBEswGLZhRXM/72lzFS8qx41aJyPSKk/l9EJBqPKGcr01g5e6cDanrH0aeSP7j4m2bh/YqBgpgkUS
	4f+oQIpipvHo9kSvPbFnSardwU28IWwdXcGUF+SipJKXGVR4knhsXOCvs0uitVj6M8R6l2Qg72S0L
	MVG++W3LzZog5r7b8cox7QypueACdBY1Gu6ifrbLrhqhEAHUvYOsYkZW+rnKlfHh3r+t/ekDI1/Pt
	QUE5+Qj+p/nc8toG9SuKqrUkR6HZG0BPHmfvXEXfXNXMFD+X90YyfOI1yr4x/W/OOcHzemRqi6cGq
	n8W66YJA==;
Received: from ip6-localhost ([::1]:65134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJCgY-007XYZ-Fc; Sun, 13 Feb 2022 11:04:54 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:44018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJCgT-007XYQ-4m
 for samba-technical@lists.samba.org; Sun, 13 Feb 2022 11:04:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id g39so1946621lfv.10
 for <samba-technical@lists.samba.org>; Sun, 13 Feb 2022 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9xVmWD4ocGtziOHxlublHeEFC7E/j/pTy/7pavDxYQ4=;
 b=HbVB0C4woVwvE1obpHbpigoQO1Fy5uxLKzJVOdPYBBzcQvtQmk+IaDET8TRd7KYzlC
 AIaISz6CFCYZRoMFKqU9+G/vHn0Ryp7J7RPvoeoXqObJ/aT4QM1hteA/86q3G2WA3tE7
 L1aycPlHo0iYpstQV0L1jCISHy5sDNf3kuEjIkGNf08mPiOnC/uBxlXULcHj0IOvRlYg
 tNPA0nKo/fXEaFeVxwYULUyiuWEIIZHM4FYLmZKulyUVXrB55dlmUos2akBbF6WY53lL
 8p8SMLxiZtNlypr6cuvD+OwX6aSEfZupkHhxUWcCx6KSK1hu7Ocd4gjems8p5z1hv/F0
 dxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9xVmWD4ocGtziOHxlublHeEFC7E/j/pTy/7pavDxYQ4=;
 b=oP0LoqYblFIiaU6Na629HXHDUoIQ3Dj42F+hJuhrWSf83GYxyCYT8AQaT/feAaGFdr
 RF4yTEq8h8AUvnI2LTUfTz2emfVDbKjB0Ea6d4gX1FVuIa28NiC3nMRGuXwybaXf/KAf
 tWsOBgOfwxCZaijLcUit5HtSun4frFGyiEBrSkbl8OVgVXLE445APkOGP+4o/ptc4vYf
 mrp3UhMY4KcjTlJU7893p5IbBn265NvE7HDHNNUkbPSKHq7pCaMEFqGn138vwND5QsRT
 9MWWxeYr5z+e7QP6TNqIOXIsnF63sLQ8ahMZp4vpTKOzbBLiuNsu4flj2AltrrP940Nx
 gPkA==
X-Gm-Message-State: AOAM532Ql2zjcKjRCPsfXRcOE5qg3QbwZeARgaMHaksMfdSRNoIFpuik
 qOQUrcGINh+44TL1TAmNxzJfaLZzseSU55MEDNx4uwVN
X-Google-Smtp-Source: ABdhPJy1hpVzOW3DJqYTm+IDhgBkRv+ZwRi8QeMAMeadm+0FW8dMjIz7fmv2qLX4Nitt02pzv1iLiPbSkGQRh7FdNTc=
X-Received: by 2002:a05:6512:2283:: with SMTP id
 f3mr7035337lfu.198.1644750287678; 
 Sun, 13 Feb 2022 03:04:47 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 13 Feb 2022 16:34:42 +0530
Message-ID: <CAH_vq2EceiE=6RWu76LkTQ07WBMxowVTz0KytVbViqDtgZVRhg@mail.gmail.com>
Subject: libsmbclient API
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Could you help me with the libsmbclient API ,to get the file metadata like
time taken.

Regards
Vikram
