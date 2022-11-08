Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDA6204E1
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 01:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XHHgdMe4feIszYMppdCPgQObrblKNWDiQjxYle8RSks=; b=3/haWI9TWynyOZXvju26xItZDj
	GLvGQoBuVXPuVw3EcV4iJ8ro9eRm5ktE+e1sLnoLmi4PeQxvTNqOI86Rj/3dfNc2wcmLVBfIOH1QQ
	CgKmLPLhabgByPQhBXPwx4bR9mY0LLJ6/cKl0KvrzJZmWo/yCBgw6X7DuvMazixMteR+PIZTRJNau
	ZUZ3Zc7Fof6Baa88e1gypAXvtDisEwo3JFEve7V6CTnqLm5uQ7fpbnLBFZT1j1jeTpop67KJWCcyB
	yCiwsod/jnkUWbO3DduttBrFZQ/zExPVtA0GznC/nkjFnpLYJ16YqVyZFQJR7UrBcOdrWo+I5THa0
	aNjMG+TQ==;
Received: from ip6-localhost ([::1]:39930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osCkW-00BPhF-DK; Tue, 08 Nov 2022 00:45:56 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:47053) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osCkS-00BPh6-9Z
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 00:45:54 +0000
Received: by mail-lj1-x231.google.com with SMTP id l8so18823551ljh.13
 for <samba-technical@lists.samba.org>; Mon, 07 Nov 2022 16:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XHHgdMe4feIszYMppdCPgQObrblKNWDiQjxYle8RSks=;
 b=h4XLxXH8Yhp2IyB86fiD6frLrGkd8Y/i2XqTJ1mCnnOaVTHsm0K4mjV9YHK7K8e66p
 uQv5drfMdAXscM5VFgcCO/t+SzMTy3acy4RpTllUpVRF1i28npyJyB/MqqC6s5SYBWAY
 BDfIu4/Rs6BjZ0qn4IMMo8/L0vRwaLAxBlNDXZswIC7q49UEX47Ry3lQJHyS9+/mKcu/
 053hdhDTuPuK/KwgRZrchqvftt90xT41kuSpgRuK/nif1gRdxARiCS7t4Bcc0ncJ/BRK
 0uKhXDK+B2nYI1x2gWtsbFS+IpBshmVgVnUafmacBD3o3VChD/GQ3Az4kyanknLCk1Xg
 LwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XHHgdMe4feIszYMppdCPgQObrblKNWDiQjxYle8RSks=;
 b=FxsYzebgl80pPX3mYrcMloP+wY1eVGDRTnYwcsJb2fGajwtkWf3ROgfb3Qka4AI2z/
 qfVg/vlBOIa3c3pqyvN3Wx4HAavxbmq/y047fvBRUCk7P1/lRaDWkWfLyX4EICffCKqd
 HbOmeQ9bGElp/fxqFV/sNrw5gNUgMtdHFDXCz2gN7QUal1iFv362vunPh0aCFbWe93Dj
 D1R/49c4nSRykpp1OH3laOTysXMMzSWo3hQpPTJgeezfKh9daui0eam1Vklqsq5h46eL
 /GQdEv6EC15NREZm7LZ3WpgnTPEvnAS/a3up4H/S4Oy2ednTPaAtpkZ+Di6dXWKGOkQd
 nNQQ==
X-Gm-Message-State: ACrzQf1LaeeZ8hMZGTVD9WvZLX2NdArycwPoocu6L/q1Fkrd/MtjvXlo
 OO7+XnixmOV0qqsa7Tr3lzc4yhFt0bFvStP4cJ1kGNNn
X-Google-Smtp-Source: AMsMyM7tU9tdzvaaGDXNitVJ6s/eVgDrkDEuRsiIGYgVCfFiX1+FC11549zOmgJ0fi80wmPJf33QqvyV5h9XUvBvGTA=
X-Received: by 2002:a2e:9bcc:0:b0:277:f0f:927e with SMTP id
 w12-20020a2e9bcc000000b002770f0f927emr6356995ljj.138.1667868350504; Mon, 07
 Nov 2022 16:45:50 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 18:45:38 -0600
Message-ID: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
Subject: reflink support and Samba running over XFS
To: samba-technical <samba-technical@lists.samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that reflink (FSCTL_DUPLICATE_EXTENTS) is not supported on
Samba when run over XFS but is with the vfs_btrfs.

I can do reflink locally on the XFS mount point, but not remotely
unless it is BTRFS (or to Windows eg. when the share is on REFS).

Any idea if there is a way to enable reflink (FSCTL_DUPLICATE_EXTENT)
support for Samba when not running on btrfs (e.g. on xfs)?

duplicate extents is needed for various Linux client features
(especially various fallocate operations)

-- 
Thanks,

Steve

