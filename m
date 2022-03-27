Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF14E88D8
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 18:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YxQQ0nL3lXUCqi/mptkJph6SiTtXhMAgY7KpLL8Evak=; b=Z102D76/wPhs/HeEBYuzuXtNgr
	hGZ4JEu4gh11xlYcGIObN/7CCcfpvoGmK6uC3rGM4mgh8Dt1/r0QjUFzcx4F2cpMZ/chqi+9dE/Ob
	fc9yS6GgnuBAAfSSQJN6u505zgIdXhQNwp3PAbmCrtGb+m27/o0ISJV1mCv5g+Jq5CYKUDCCivpEX
	fAypyubSU6guOzGwm9Bb7NN8DMdME24QX1No9OCJw/HTeDE7oDGruspuzo8t/WXycyj5pbJD/6teg
	b5fJ8dtfByU9ezN0o/86GLFuGKa7Moe0Gjn+nwclv/RJa0eqP6l+1TYHGl69cJwB1IADKZIUURCHf
	uUcXxBxQ==;
Received: from ip6-localhost ([::1]:65214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYVjP-005htv-9d; Sun, 27 Mar 2022 16:27:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37862) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYVjJ-005htm-MT
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 16:27:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id bg10so24137203ejb.4
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=YxQQ0nL3lXUCqi/mptkJph6SiTtXhMAgY7KpLL8Evak=;
 b=Da9PI4yNUk7/uVOwSxwYNa67gMYOCyi1er3T1Ww6Xbus/scBjCPorSzjqXc0rp4tuZ
 BVcoYHxnhEZ/JIOXpoMMHWs95ViRIvfrk0cCv1U/+VkQnFqVKqOIiMsocKqYJgOSGSKZ
 i09Pqlgh7Eq1O5MG1wH3JN7//rWE1OCR7u0yPDNGzLqvTxz2tDqI4da+aPxnmGdomSb2
 w8R/RuTmPTiq1iKdpQt5S3frSoM4buzj6usqGC8+hoG3bJX2oZ9L3aY7JMPOzKR41s/H
 oF8r3eA9eTwimSmxP3z8xky9yguN0mdw3lEJGgY2bKdzRP/J2yS4Nzyra/TbC8K/i/uz
 /J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=YxQQ0nL3lXUCqi/mptkJph6SiTtXhMAgY7KpLL8Evak=;
 b=ZVsPh+tKbeW23ASaL7zJxQdbmw0iN0y9LnhucmnZvw/BSMZZUkKTR50bGNWnlNMyec
 Dsp/zOWWWqGHuqepKdqiZXHrg5kQ4p5bbE6if6gKMBsD2eD+MfY4WQ82SiknPXKF7HC2
 ic6JKO1QsB5K1VVem1dveTpJ+lqO6vDsEchp0+DYHUYnyf6OfzdIS7fTNk8uDGYnDRT9
 pSKjta/nUgAcxRrkg6ZpLDvjtHrGIx1VTBC63bXHQExrgNhHa3dPSvNHZIFGD6h2e2nn
 cY/843d8+SkQYRHc4kKJ5zqjujM2rt2IM4ibFb9vagC5DlLXU6VgjdzVGRWlhSr5Q42Q
 5Iiw==
X-Gm-Message-State: AOAM531covXaSH+ReC3z0avhtjQcWbOgi4tw5bdSAZctpzp4+OWDsQgQ
 o3SW7MGydoJcCPoLD0BMvXJGae7pXaDUSCz7XGQz+y2y
X-Google-Smtp-Source: ABdhPJxm2XpZME+BDdI215SiIyWj8IZgGT6ZWztu6nAWpVikT18Jc1ZhSkZ7zoEaBAKOvt0HADxe2vqji/FXgXewMh4=
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr22861007ejc.285.1648398420682; Sun, 27
 Mar 2022 09:27:00 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 27 Mar 2022 09:21:38 -0700
Message-ID: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
Subject: Are there Python3 libraries for the net commands and etc?
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

A lot of system management scripts these days are implemented in
Python and I am sick of using popen and system in python to run Samba
commands and then grub through the output to figure out what I need.

Are there any Python3 libraries that provide the functionality of the
net commands?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

