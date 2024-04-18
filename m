Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B348AA3FC
	for <lists+samba-technical@lfdr.de>; Thu, 18 Apr 2024 22:22:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vjr23Z53w969AUhAblrzf+t0LGa6uC2BR9O7rxvFrVM=; b=5unmpjlFyC4JLSfW5r0xDxgXCB
	APtOdrNJGGmNv1LDfY17Pkh/UmW+T/L50S9kzo1wVfUNBoB5giooCtDcc7KdbMhggo5uham8CVcLz
	KuKNqjjfEOWSAp28bnEZOy0NadvHp1S9RpCy0zWdLPMDG0UVrLmIYdSmYlYl7jqOe8QcXHbeFIVqC
	ExENX8zOZdqb72aNE9aN5TbSIsBQ4G5esYSSvS+iA3kOOAhc8nUHCbni+Ek7/JOOCSXfYS8e6T2o8
	ETQfBS3zgyTm1JPRVz4XzJQZvGOoWOYl9CgTYL3ryMk5NUvp7kcRAnWFx999soujz98F/XgfVPMVG
	XZHWdOQw==;
Received: from ip6-localhost ([::1]:26188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxYG4-0057ED-DL; Thu, 18 Apr 2024 20:21:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:44349) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxYG0-0057E5-OS
 for samba-technical@lists.samba.org; Thu, 18 Apr 2024 20:21:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so232604e87.1
 for <samba-technical@lists.samba.org>; Thu, 18 Apr 2024 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713471679; x=1714076479; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vjr23Z53w969AUhAblrzf+t0LGa6uC2BR9O7rxvFrVM=;
 b=MiD16andBMwBhu4UlDleqNjx4W6sdwm4aJlBdBCQjqaoouk+VRiNLC7RITS8zSGIGW
 /M0AGDQ5XTj7/m+m+vsb3t4qKUwKnKMYZCu82qAu3zu9eqKHYeplXZw20s7mvslEzB65
 4PCXR9H1z8VDHnK0qRNF1gUWc8FXHCMmSQXjLE99qmzvxe9pQ3r3NXsS+20icUuGUEfc
 BiBJRoK23y1dSSqWF7vIIDhcPe8PO2lVXqrQjy8hN2c1DKKRLj/3mear7rzUBwDwcTPM
 QNUX+1YLzkg1NEDDkOEp/Ckp/Ft4QqsKsfdcTKGKbUu0Vf7w9sbAo2+azxm3BPcF3nTd
 vhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713471679; x=1714076479;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vjr23Z53w969AUhAblrzf+t0LGa6uC2BR9O7rxvFrVM=;
 b=nYXOvBaEciPobZH8ZTEGoTo/yugQW+/W2yBfE80+vnji5bD5y+pCo6jfqMD7v7/z42
 zsbuI8w0p23OqMJZwB6lLxr9qMMvgR3IRcplGzub36EHpJYsKKCzNRJbwjEBKXidN15P
 CAKOqAlhbCiz3K6EO6p3H0Hz6gFYn+vPJPqmk6x8qWxdzl0M1fVqWbWOxysURgiQqRIP
 eSnamY9m9rctsTV7/tbGpsOMkUFilF5CkmMR0J772zrxzVSGwuukif7ny3kV/aDuC+ST
 91mfmFFzBxOsx2199VEXwpeKdkV41WHUpWJN/doCDVtr2QXYeIFvrXoz8mDWstTTPXUO
 f6OA==
X-Gm-Message-State: AOJu0YxQKdbuZrZvrQ+1qxBleuYUBIjbcfAgu1An4evy9zDVhYnEuYHn
 9wfCm6zyjKYPh1rXbA3pdMVTvpIBuUezTF1qUhPYY2TsRBiyctlPEY39lgt57Zlzp31sU6IXrAT
 xVu3MALOwwxWzzINWT4Eh5851pWCKJU6T
X-Google-Smtp-Source: AGHT+IE9sYOveWLhfEBtHB++ePCrCeDMXzV+t2nTAO0CXzN2nn9QW5X0bOZIy7TTBIB1ldDDdH3kxB+nMZQf5eKv+EA=
X-Received: by 2002:ac2:5381:0:b0:519:730:b399 with SMTP id
 g1-20020ac25381000000b005190730b399mr84137lfh.9.1713471678809; Thu, 18 Apr
 2024 13:21:18 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 15:21:08 -0500
Message-ID: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
Subject: Missing protocol features that could help Linux
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Was following up on a recent question about support for Linux features
that are missing that could help us pass more xfstests

Looking at the standard fstests for Linux (xfstests that are skipped
or fail for cifs.ko) to find 'features' that would help, perhaps
extending the current POSIX Extensions or adding a couple of SMB3.1.1
FSCTLs, I spotted a few obvious ones:

 1) renameat2 (RENAME_EXCHANGE) and renameat2(WHITEOUT)  2) FITRIM
support 3) trusted namespace (perhaps xattr/EA extension) 4) attr
namespace 5) deduplication 6) chattr -i 7) unshare (namespace command)
8) delayed allocation 9) dax 10) attr namespace security 11) fstrim
12) chattr +s 13) exchange range

Any thoughts on which of these which would be 'easy' for samba and/or
ksmbd server to implement (e.g. as new fsctls)?
-- 
Thanks,

Steve

