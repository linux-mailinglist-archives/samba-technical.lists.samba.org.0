Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D782ABE53B
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 20:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=a/Fap2LLT0nSSiqB85c2eoZcR/Z/aLG3sYmNoYFb8c8=; b=E0GDaO/Y+T6+sIzmi4QAi2Lz0I
	arC5J0iblGxRpqNDx7t3SobSwBbrbsS2mPX/gO0VwDCn1EVddQ6vpIv45jfqBXwAQsFYDQWR33lbh
	8gS7VufPKDXnrLFcDZ7CNr2GNGSfEjWUw2veebHgdgVrRUPl7Ku2izqdeRN0HSeDze1neBY1o/Noa
	iyRnfTi6dDAsWaHwytwTWG3YBG1AcdUQBA7UYFHYTxvbuOPxdTj2NVtEdQmdoVsHhkRve5nn73fWl
	mZ8qVEo05zATqGHD/rxE2Ae8ewUCqX5wlncb+oKhNxXb09f2zQyYp9ZaR8QhE14uhDEJY0kwKQ5t4
	KicqB5CQ==;
Received: from localhost ([::1]:62294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDCRQ-008cOD-UQ; Wed, 25 Sep 2019 18:55:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44131) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDCRN-008cO6-G6
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 18:55:07 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i18so8124331wru.11
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 11:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=a/Fap2LLT0nSSiqB85c2eoZcR/Z/aLG3sYmNoYFb8c8=;
 b=isSbwEA/C131xcFtmxaCTaAvmPStbsN923MnOIh/bxwjGX39vMsdGzwmoVeJKzvzoT
 dLfH88zDxsmd9yw02EtlRWINR291g5Ajlu8zQUJzQsfvPV7cqocu6fwP6ao30wEgzaTk
 N3XSFgqVSngvppFyQlTA40ldM/PV8Bcg0LbCs6CGdkGk62bVk76Jfgu1v0ENFGJ8VlDZ
 puycRMuYhO9EkGIMTPH5y1gns0KFJCV3PhqJBMKOqiOGl9wdm58IieLZod4Y7DHUzP1G
 RleA9foHeQ7IZC29z16HLk7pz2GB+LMx3ZJtqvc6O0NpxUa4MwXXLC/KpQnyO8cSQ1Gj
 BfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=a/Fap2LLT0nSSiqB85c2eoZcR/Z/aLG3sYmNoYFb8c8=;
 b=GYtHdqTR9zScf5i45j8N0hMNtX+26/kIYSi238Fo16Cos3vIoL6oBCYNHEg5rI/a9b
 1ZlMVBvZI9bJI36J3ODeizWtOUVwE8US4aU37NklRoxWD9bqeyDXZLVXFY7jcDgPCSFt
 CkDx/nunyDHqgSMS2Y7OsEaNElnOSeuX/bASmJpZwpK2Txb1GQNc/Cm1Qn9QgDlWOHGQ
 x/12cCHS0qKRuXoQlJrOeaNBmJKBZyHNfmL/rmU3uPpsyNMlZfgvXx+pYjKC06YOcmaY
 ZrvvrPXBmGNswP78vYqFFYvd2Sl3+H0xd67xpAdRHjhPHA16rDTNwtyI8KcA8KYGt9Z/
 wB2A==
X-Gm-Message-State: APjAAAUO3Ifcw9a5yTxU1/SNpS0RDSMN6SBzKPwm75k2L+mh7hoWQNcM
 /HdzLOo13SUIOpIJB/kXk+/UAoU0aDsSOGNUSWmd1tsX
X-Google-Smtp-Source: APXvYqx8kP6++2wfWAeiPSpu1chX+1CJm4BKvHx63KVHLe3dlTKAMM6ii7JKbBanacZ/Se+Q2FMzkVHBKtXpUVnUDkE=
X-Received: by 2002:adf:dd41:: with SMTP id u1mr11097124wrm.49.1569437704592; 
 Wed, 25 Sep 2019 11:55:04 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Sep 2019 11:53:57 -0700
Message-ID: <CACyXjPwcp54B_LCJ_2gnXHZ63OvkTkb6MM+CX2GRXteRi7wyCA@mail.gmail.com>
Subject: Writing a Windows Explorer plugin that uses a Vendor Specific FSCTL
 to access extra metadata about files from Samba
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

Over the last few weeks, as a part-time activity, I have been writing
a Windows Explorer plugin that uses a Vendor Specific FSCTL to
communicate with a Samba VFS module to retrieve some of the plethora
of extra metadata we have in our file system.

It also allows us to set some of that metadata as well.

Since knowing that something can be done is often the most important
step in doing that thing, I thought I would mention it.

I hope to find the time to provide a tutorial on this subject as well,
probably on the Samba Wiki.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

