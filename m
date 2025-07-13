Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 564ABB03359
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 00:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JvLWzpHBGFzQ5EWWs1pWlh/lpVeF9I6Yr6OiXDw0Dks=; b=UrsUHhHkQJ32W8uXBCo1894LBu
	ZUa9+yzMTHt+MGfpXjEhrPqGCZ5fpVEUWejq9PLJd22kGD0vonjhPZeiDCRfBQPRK72SKjO/6oia2
	VFqIQKt6ws/jRbk+aNYcOEOXvp9lKKR/DkIvycTiuZKG5YvwvYTG9RKDaJlxTk3+iQuFbN8LlXQEj
	jyNXsnRH76Iyspubg67YBCkZVh5SAQUeZ2I+pIGL/Bj5FzmKuVfskdxxNQRIFbwywwCpZlvDPcIHf
	AAlzJTbCMYgwknRRSO1KyjUYVkoi3l5moDE/vgY9/9/RtTYnxCfEsqEty5Pg0k548M0IIHF5ftDGf
	9Mz0UYFg==;
Received: from ip6-localhost ([::1]:40518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ub5eo-00B5mW-NB; Sun, 13 Jul 2025 22:58:54 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:50454) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ub5ek-00B5mO-L6
 for samba-technical@lists.samba.org; Sun, 13 Jul 2025 22:58:52 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6fac7147cb8so57538726d6.1
 for <samba-technical@lists.samba.org>; Sun, 13 Jul 2025 15:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752447528; x=1753052328; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JvLWzpHBGFzQ5EWWs1pWlh/lpVeF9I6Yr6OiXDw0Dks=;
 b=Z1YEa/OcmU8jBY0FZQBh80NWizCOepLa+qfoATC7qqlNrFl52BfZExn+OkcpiqoVRE
 4dvxpMm0RKO/bbyOZTjI7/YUQOfJ/ENdI4zzbdsOC3MNIXowbEWD8vf6gRq89AA8Pgy7
 SSch5Jbw4FMxSxgqntyMzbUhQTy0UKaAmiB9Luf5Uz5oh01QOxOH5rk7F5jOtTIqEQb5
 Np5lZYvxzoVPGC4pm6ZteCUUkOpsEl+k7wnlaOSgCZryXGWInJjGyXFQi+daYUFP92WK
 MlRdWHI7PAkoOXntuN6kR3fta7+qhpOV2AvAM13SYzIhhedPrdKHj/vync/guiO0mFC+
 mnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752447528; x=1753052328;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JvLWzpHBGFzQ5EWWs1pWlh/lpVeF9I6Yr6OiXDw0Dks=;
 b=dxxt9n+WvMvumtS1tZVIq47qJebmTFE94gRxBHgZBVZ5AmFV8axK1OQswVUnTyDtkq
 y8Mf9zvFkpzmIx58lrjly2wv7c8MCawX6R+GrKbCUfHgL3+UgNopxeVLQuCLvtVLTwbQ
 hdzMa0fuNChIYW18c3MJJTN83Q8KNGStXhpyMCZnrQO4poEKhw3Oicsmayy6AM9/4GLO
 VgSF8W7mJ3lcybc9SPnB8HwM73rTAlc4hsaPS9gzHGeO/SlBILnkaI7noDOKzatFmB0V
 dsPRiAeT3Usc+Zxwzc7sxvBnTaFvwBPE/v3KObXzXKudH5SnkZ2TNaAXZ3m3q5w5bAax
 AIag==
X-Gm-Message-State: AOJu0YzemsUqBrTcDTC7bTexNvXFVwGoF/iSpI0wwavTlWeprSxPIGBM
 QeeQqULNTrTAMksqwJcArZYMjtoGF8VhUC81alt6FlYeD6QPzHoxuXbq7C+wbTw9DlmKz7JWzQ2
 0mYiZEaxFblV+gmQ0jgp0LCIp4c8KA1z+L3+fDDI=
X-Gm-Gg: ASbGnctM9Q0tng2vtdCXUOOVdo2Yu6trovxeNMf0gCZpAutGTA/Hc+kj9FmUT3UZyVL
 +e2SU+aj8PbWnN/SrNp0JaNpY5OnTaNsf40NStlzpjX03kcZgoGlR9GXRZEOmvmb88AKtXNOkt8
 xyGww5lFsEckTUEAw5vRiGFt6L/FEbM+aA3B2YJly8JodzRuQHEjWriDdzRti4aQEoKQDT9qUnB
 +k6xf8lquOYWb/z8ipwTwqoftTNtyhL4cTiBmau7g==
X-Google-Smtp-Source: AGHT+IEgzEdGYPN8Dss7qVm5oGqkUZ2L/OVlPwZ599Oa99opzklSNjznYDdXtf4fmpV5VyWjgqLCFYuKXk53vZgFhVk=
X-Received: by 2002:a05:6214:598b:b0:702:d30f:80dc with SMTP id
 6a1803df08f44-704a338aadbmr200041406d6.11.1752447528398; Sun, 13 Jul 2025
 15:58:48 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 17:58:37 -0500
X-Gm-Features: Ac12FXxXU9V5Km2u8NvpOgDisezgfAsw5O6A8G_ecHdP4Xmx5bK8ctuh7bfaM3Q
Message-ID: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
Subject: Samba support for creating special files (via reparse points)
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was trying to test out creating special files to Samba (with and
without the SMB3.1.1 POSIX Extensions) and noticed that although Samba
reports special files properly (as reparse points) it does not allow
creating them (it does not set the filesystem capability
FILE_SUPPORTS_REPARSE_POINTS except in a very narrow case for offline
files, so clients won't attempt to send create requests for special
files to Samba).

Is this intentional that Samba server does not allow creating special
files via reparse points?

-- 
Thanks,

Steve

