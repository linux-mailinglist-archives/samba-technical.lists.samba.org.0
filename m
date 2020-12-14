Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DE2D9189
	for <lists+samba-technical@lfdr.de>; Mon, 14 Dec 2020 02:21:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d7JvA8Nv7iH1ZVMJ8mFDtnTgcKZcU2R5Yr5wBpx5tao=; b=exw4MmOcR3+X/KJT0QZ4cYnmQS
	/7vRovH1PAVyQ0CmV5SAIAzLQxRB3pPjUOSeERLEilmV6tY0xt+W6mDiLVFGNXDZmw5WkhptaUBjz
	c4NA3k6GMhqwN2dxXkXALaKwLzR1IUJJpyyMh+hpS9fIU74HC5m15UyWTEd4O/UoyAHpdpQC81MlT
	OgxjD1RLmNaEaTC9tLEGWR6IQON5QL1036zA0z97aV5SHGgucM9uqQt1vpzJv7hwgW2xpgh4Uqbkh
	ujuhYT5XTxhMGcgRbSxf9PGMNMDux06emfCn4tGCUoss41mhUpXWCJCwR8umFacF2+9TEiEMrvCVk
	uEaF+/lQ==;
Received: from ip6-localhost ([::1]:41536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kocXR-000tuK-EH; Mon, 14 Dec 2020 01:20:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:39664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kocXM-000tuD-8e
 for samba-technical@lists.samba.org; Mon, 14 Dec 2020 01:20:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id a12so26076808lfl.6
 for <samba-technical@lists.samba.org>; Sun, 13 Dec 2020 17:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=d7JvA8Nv7iH1ZVMJ8mFDtnTgcKZcU2R5Yr5wBpx5tao=;
 b=eUVPJap10UlFCoWUVZ/0ozHkqjM2yroS43ra9NRBt2lDRbRJREX+FqEhDVpKGOwsSY
 +uVskOC3MWNh+ev3PF3wlbq/WnLCBd1tx8+z8kUMHdSBmHq1p2DxomLOSq2v80/NTamU
 uF/xuoQGZUqajFloHNCEs9IN+BjlvPnbEUA4KblpP082TL+7kMDu4zt8FiW1flr6gIIY
 wCNSYyt8pFMwRaBEuTw+rT05yzcDLZhkM0pAvOcdUXSHSK8+qkS//Oc/zomRtMAqVFAy
 XHbln1LMx1g4cGvf2a/KZ3GUERAP86oYJNN63BhEY1IdbjSJPY2C9KEyzdCNbl4fowXR
 5zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=d7JvA8Nv7iH1ZVMJ8mFDtnTgcKZcU2R5Yr5wBpx5tao=;
 b=UZP5SIENaGH6vYzPCg1afc/zq+JpZhVAQntbsIqMXSyJxVZPpM5EbpJkzPu8wH9A97
 I1OxVlUtcTYBVm3GVoD/W3rZdlneqNcrBr642alfSVGrRvMVKjWwvA5xVBP2AEbvMxGo
 wiDBslkrxCr+FHTF/JYnFC2gbBqdrP37l+5vuuwNmFg1DwhDCnZl6d6o/mmjcVVfU8Du
 1RBi0Cigd3Kw9sWxGofozcfvTNCQ8zJtAOFrLAiwKA3RyfFp+yRuKva7jnjfdfHhwaWy
 iMwAP9MehyZHQcozreh9KpHBjw/XgXTd+Buez0U1L5IL0V6o7uI4mKXsmT52Bvz5aZa8
 9+WQ==
X-Gm-Message-State: AOAM530JPelXGYcGbDui6r5zUVbNklUUEPHIjnSt99yK0bCbyFO/xhmb
 KZRFA0Hu0AppuYE3S3e/J+/53uLIj4SohP4NeDY=
X-Google-Smtp-Source: ABdhPJz5d7Pb1uATsZd40cCwHUf+9EeBMnd9hycXTRTuFQ3qz7gEIDGURVZL3xMIKWcaCeq0fVdhS57/tPBvAkOTCEY=
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr9220646ljj.218.1607908820034; 
 Sun, 13 Dec 2020 17:20:20 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 13 Dec 2020 19:20:09 -0600
Message-ID: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
Subject: updated ksmbd (cifsd)
To: Namjae Jeon <namjae.jeon@samsung.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I just rebased https://github.com/smfrench/smb3-kernel/tree/cifsd-for-next
ontop of 5.10 kernel. Let me know if you see any problems.   xfstest
results (and recent improvements) running Linux cifs.ko->ksmbd look
very promising.



-- 
Thanks,

Steve

