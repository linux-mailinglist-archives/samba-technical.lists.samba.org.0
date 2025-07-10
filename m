Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A2AFF7F3
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 06:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7gnPIUyT3f1G2z+TzAB8N1WPDBtbEShVAyaMW0dB0nA=; b=2r5WbQW0u2eEsljw/rPRCCKTfn
	ds6uQ8ESX708XRO5HQ9i4rPYhm27++9VAeNOBvO0UcPks9bbzUNOHX6ZikHuiUx2MJou0wUL9z5tJ
	FnVStP12v6XnuxWLJTh26Pl/AMgX5kmdEaFXvc//5rXdmLRsxMbl2tPj6Hp+NaqEv/Cw33XMwJjhc
	KAXumAe33dXZsUIHQhRkugCoJ8mFhb1+HRmEilivL0WfyN/SbnotcUK3D7cva3FCAwxAGzwWNNQTq
	tgvDxNXuCCIf8qq7yIJZ479NP+Bi05BoQ/ZU661qHhNdTUqcqsvQd3pxv2FVgj9cngUrpjQDR7mAT
	EOJvygjA==;
Received: from ip6-localhost ([::1]:60308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZinj-00Auf5-Ke; Thu, 10 Jul 2025 04:22:27 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:59597) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZine-00Auex-0W
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 04:22:24 +0000
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-4a97a67aa97so4114681cf.2
 for <samba-technical@lists.samba.org>; Wed, 09 Jul 2025 21:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752121340; x=1752726140; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7gnPIUyT3f1G2z+TzAB8N1WPDBtbEShVAyaMW0dB0nA=;
 b=YKrrY61BAZIuZOcyXDlnxvyX0jLHNI1Gv/V05/4mMkYvr4hJ+Mv5kmQiylNB+ZHDov
 wuBW/aE6hgA8jXTJqlwkOeURC40A7Y6eP4a6lQmvJetFzUPBcWAJrE5cOpOcabIbZVkL
 ETtJMHZuEwQFuzpMHo/anyF0i3hAEFWSZWZ8MPLCd3n8coR0IV/xFk5HmKHKEopopSTo
 u1T2Fu6l65d5mE0hPK5NKwyzjalyaD6Lp91TzD2QA/kZNaHdnbxvMElUi+odvWjOB73o
 yAJ9SitCCr2mAMG493ruCpx0kL+KBRg08s8NEG8WRfienhsQ7PMcyh/Ffuev1HqzhBbc
 kWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752121340; x=1752726140;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7gnPIUyT3f1G2z+TzAB8N1WPDBtbEShVAyaMW0dB0nA=;
 b=OULJKlk1HY6OfAXNn93CRtCRsIG2wdVdS0WlbvgpQMNIfR1D8Ti047q3zSUj6AXmpY
 2/q2EsUEjtkOj2IbHertm+bqCOSV6XV5PmSIaONXSqBq2FPWfLS5X9zbIB7rmBBxX/4l
 9r2/23GK1xRN7uZAmtC7sDHjcdLnasZDIF5ja485gUAS/cb12Ed9Nres3WkWvwAak9GK
 bFC9VrWLRAFkh6CfxZtGjV5ZSQEHsFNnJMzv/X++BhXeQAm2s6dL1t+XUlqr4lNc6s1N
 TzbHAwEnWXW8deGT7ohRLFJmfaCHlQs5J1JjM/o6p3Y4MKbL4VvCBjMkOm2R0W04w0lu
 3imw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEpxpZiWyt08KXpvtgPDxtWmjDEah9QSI0k+SmDJmfiOOhMvuGm+8SN+WJohJosxniIy55gM87gnO9UZ3n9Vw=@lists.samba.org
X-Gm-Message-State: AOJu0Yxl9FDP77OqicCwYR8V4NeGNIXl16xpKlKoX4gE8vVa+PsF5Ei0
 BSS+JacW6OIT6Twa8MzqCmhkNxgvYxKWIbjVcbF9b3mHqv+vsIJeoWdk7AkkhuCRpK6m0DtMM10
 QGoTyYfsw0zl+HK7uMhL8zXElJ9PvxRg=
X-Gm-Gg: ASbGncuBj+Yh/VyHIIeVi/ma5FUgedSRQp4Ey37sUTi2wKz0MN0s2hJtZgaTSE/2zg/
 yT9LSklQSfdsUATRVuwK9wA9Xi2VfgmiycgxKpEHVCWanIHfA3D0y3YjD+7xoi46qcytNGqxLt9
 9sItTwVvevluIDVEoRpJK4+GK+1uTmyRIkyt6WZG7Yvv+RUeN9s0Lln+yZYyieqdqe41e9TnQyw
 7/v
X-Google-Smtp-Source: AGHT+IFkseOjnkKcTR57OiQdfEqXh8rELuejv3VpTeBXiW50cV6spcrlrGdTmobtcXAsH8eHzOu6Nc1XBbBT/BmS18s=
X-Received: by 2002:a05:6214:21ce:b0:702:c8dc:c4a8 with SMTP id
 6a1803df08f44-7049801cf0emr12229686d6.11.1752121339986; Wed, 09 Jul 2025
 21:22:19 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 Jul 2025 23:22:08 -0500
X-Gm-Features: Ac12FXwNDfL5mMjafd4KxudDm6D8aIY7bj-OLAcKGBstzeGelxEnqNtFeWSE4Wk
Message-ID: <CAH2r5muf4eFPiVjT53Zbqirs8DTsLsjnTpGJV1sA_DYj+98x5Q@mail.gmail.com>
Subject: regression tests for SMB3.1.1 POSIX Extensions - many tests added
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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

I have updated the buildbot (now over 250 xfstests successfully run
from current cifs.ko to Samba with "linux" mount option, there are 17+
test failures to debug).  Very good progress.

   http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/11
-- 
Thanks,

Steve

