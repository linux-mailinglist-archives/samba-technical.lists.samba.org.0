Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2636B629
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 17:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xX/fZDcqVYcEs17jqnitQr1PIKKNDRHO50Ga+chLlMo=; b=so6hBfeqd7kZYlHiMnhdMM41Xk
	FwG5LxWtMVO8kVNuR10tyqKHd1nxgJbac0btPGaaypQhpCFXnUata2H+wCzDrDNarjkxlul8CmTLU
	4mtRL/yPDy/rlhYDCY4Eaiq4tyffE9VlvIrAPRnsK5MufhUu2h3vL02rHWehjdooNI+/2sqP/t/Vb
	2hAPsXipHyanNAtnytrdgS0PxUtjbZ8ZTyqb1jp8AhYuhgEfDmHvvsIFsnCPpGsHdlM/l+Z4F4wPh
	r655U6893pem/kXeW+FK0gPapVpsEBt90tgJBMRGj24t0UY+ktn30bVgslsr2VOAYArKet7uNY0aw
	mFChgp2g==;
Received: from ip6-localhost ([::1]:62818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb3Xr-00CVVo-O6; Mon, 26 Apr 2021 15:53:11 +0000
Received: from sonic314-13.consmr.mail.bf2.yahoo.com ([74.6.132.123]:46052) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lb3Xf-00CVVg-A1
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 15:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619452358; bh=xX/fZDcqVYcEs17jqnitQr1PIKKNDRHO50Ga+chLlMo=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=e3uOL3dEbfxdsXAJjuzUOMzxXFu3fJbv656RcYLcAP1xo4Zhf9mhNJDcA/RxNLz5VxfiEqKJREvZ3pthL/FRUTR0ssDyfTzLv+6V3Fskx8XhzX08Jwub7UDUs1y3A4F5BXQPxDi7FkUVQ4LH+XGMVqXQit/qH63QhcSKd+5ceSnV6hg+QVI5O+FHSjJ1m07PJR94CWgrw/aP0BLJkuxpqy08vFVHXa+3prUB5YRSvSEsfzGOdLY/C9EAESjQl8NBrHiPNOjSts7BmoDQiLkgntaRNOttjWTaX5W//5hb0sL37pIj443r9fDnsth3A9RB9sGPU3rsPDQ1vkALA+DHMw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619452358; bh=afcp6SEX+VuYhB1ymQ/5wr8j+Xt7cACMhF1U9bYFsar=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=sAj4dpHKTSYyY4qEMuhCsdK3AEG+pIV+Piccqk/5iR/6xmWnfgQ61379V11PmSWwRz67zokFAefC7alpEsyBc18R2KRCVG4v1mptposoVjvHE9Zmy/JQYlDmJ8r70EPaYNIrGV3Q3d5CRp6rVtqZgNXyxJF+1NgN7wdb7FxggzlVcDpxjyDP+EZjSyypT8WyPlG3RyfwgYHRVouxvcBcEZw6EaYM+3mJbMxEM0YK8tpqPx+9UMurNwTK5uf4sJQxVNQk2K+6NJJXWzkNbV6lB2OgS0BZRzXJn7dZDwkxfOV5mwe+eLj+siPtOkcOS/U/jFGDzS6BDcEwDAJKQsJQBQ==
X-YMail-OSG: 7CmJUAUVM1l4pnaVkZxropZSvKm5olNgXHxGCake4XLlPucV010JJKqzNfX37Jb
 o__YZ9bU0oY09f0w9szIAxg1K.uD_1ULnlTeiXOrnoIVt4UlIZHyqFqTZ5rmlY9Yju2fJopHKGKE
 GVAGr_OQeNieG.5dVdhjiJxCqWkINRsjI2ecf7XS4geV3uxkwZzCmWwlchWsF9tDOpH4bvYXumxc
 T2kOM0jyepMeOGG8usb2DLvG5dvO5KwYohhFhUJqIScJimsdrS0bY1ryE2kptLOTCDlv6dQLZEKn
 mum9XtzQWC4rwFAFOf7OtR1BlUNA3b8CQqMpTsNZ0WrZoBnLNO948FqB5FDeRc3RYbvAJHJ9vNdR
 hGFOScX848CGnIfTL_.9FmeabzDobvmES5rTOzUXVPmhsIab9Pg4waTWYDs30nQjyaRiVVy3Bz_r
 vwwOwS2sNJf7N8kjKvKyYEMFpPfGilAG3z64WfinemD9Rnrcvjh2EAs8tzaEiA7AtqRT2JZBAiHO
 jklR_esIkk_Z3w0TfYl3e33wVc81qo_A_zfOTWNVMbmpTatjcAUREhJOztR_b0kCu4t49OZ80MPz
 MIRP9XQ7ymu6j28c96Ha7Hx5x9j9AwBWwYBHP_9rLZPugpf3nXKWPrS0KU_1ti.y_ys7fBxjth2G
 j5gNdtI1EOI0NXkF1goCdMxpLksIUX_MR_YvYGDTWND1XD25RHkl583oecTaRUx6Q_zROztowQ6I
 23D2ByXJ09ej4RLjW563YQCGYU3VIcdObLkUXfxoyCTua_yyAM2Ws1mfW_8_xQHLKCJZhncMDp0Y
 UsoJyRdVlPdy156kFnSTcYdZg7sF8F8dJvwa8v_BmQcK0EUbavdqDOcUq9aULqWf3lbuffAz.mjU
 fYybnOe44F4bHST31Ertx_mzs1UZKRKxltl.4QYH04OZnkmDx37X4dumWz8BOQoMSQZ6Wqtdcz3v
 SIMLfmYvho4LsvBoUrTyTZhiq0G73JR5A0kIFgIBRv1bUOxbXaItBYJpix.7OK_8Z73b3_jPtzH2
 l76tdBJ.fJmoPUQK8tphdrzJ86qcDH8FAMaG3jfuvzJUF4BuFymw76MIhYgMZglKWRthb8.JJcvr
 C1Dn70Ft523jYos0HDMOhBGWcdMdxZtil6lJu3NQVRGKqvTrTsiwZ4ZiJEORTVgRpyEEz.Ulz6u6
 tGVklUTqXMWe92BS_BnWigZ6xqWEBM2yJI9z7ZaZqZ6IFcy1FlmCfGvfn7c6HFS6sRBB2a7MTeA5
 ttd64KpQuZCuk3ua78rS7wlXz14adDO.PcgwVJuVND1vGvgjo0zVosPCzxmfp4XpKvcscEcgl8II
 8QBK07JZub_uv6tEqvfKm6BSA0Rll8g_2RS3st0W69SkBQdtMlxb1In3PdSqmrSvWdIOVXmwLjxd
 lwk0IaOE1vILfZ3G7V920FxW5cJeroRJk8lCs_N3yg.wadF8iJm1I2NdM68xPZNDgAXMdLtE9ICZ
 We2KZ37wfUB_x2I9yo1jypZwKOLtXPaAyo4DgoQXd9E4ygacmgJT3rMrx0iA8.W8p2DdAGUotoWv
 M4MHRWceitTzMDLQpr_rzYhxREK1Jb4u0Dw3N9p9_7PBFv3q0ezmOqMi3B9AVnZqeRxgiNKHdUlC
 azzD7k6MjjLdLqg29JbQxVtlPfDBgM10yQAWYYIOfrGxvhO74MQCklFv.1gcXZtOGrtsVpeTloY_
 OV04h6WJIbpkPGeTd6MOIaeVC6dCAQt8PEnvVEad3dkTBJRYJ4CWfWcwnT5oJtPSBXHFLJk14IAo
 1MM.NKg30lDjCwbaEgIDMmseX178tIFsT3d4VnJFzFT_mMppOWQdx_clI4wx9GQHOqri1N8pcnRA
 CuVQsI3vA6RPjNcMD47kZ3rynxDX_ydTS_AHHXmV0I7OgORwkG6mU96aCfAF.pCVtUSXhXlO2Nd2
 bsSHBN2hEzrXIOe9vVmf9LBqTG8t9PWmqT8oOV439Fhf7TunpS8Nh9U8dYovAF5VDXdUNjK4rsOx
 YKdXHNl4CkIVNXJkrP6ue9luw4KwgPzmnMvqSBNzWpu.bd8BTuj1btlJ1HWRAsbb9yn4f.W19TQT
 oUlFNZt_H0zDgQhcH3Kq81WPZp2CxIrwmQyJh_uqFHbpmHT.m9RqmZprsu_wn8g3WvNH77k75iDJ
 GqP.SsUxlhZSS2E_SwPQwm9kBiOBKbFuhL0wgYX0VoME8USmXKwGL.Sdr6LCQLPBzKL4uYaXGOu_
 akg_2T7Bj31mKALvlxw5ng8..zfOx.bgAZnFbwaAsfOSnruXH45kFc0fEn6a9JW8qgx4zXHSTstc
 gl7NLlpd29PUP3tcjYqtMocry8f.7FdKm7Dq8I3FtploShom_igaUehkGszAVSF6Z1dUdB5X5MXm
 CV.khqaeTUExUhkeMfwjunCRHxMslQOZUDIgq8XTdSiBxx0m788fnMA--
X-Sonic-MF: <hack3rcon@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Mon, 26 Apr 2021 15:52:38 +0000
Date: Mon, 26 Apr 2021 15:52:37 +0000 (UTC)
To: Samba-technical <samba-technical@lists.samba.org>
Message-ID: <568442653.399407.1619452357983@mail.yahoo.com>
Subject: init script or systemd?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <568442653.399407.1619452357983.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18138 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/90.0.4430.85 Safari/537.36
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
From: Jason Long via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jason Long <hack3rcon@yahoo.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
I installed the last version of Samba on the Fedora Server from the Source =
Code. In=C2=A0https://wiki.samba.org/index.php/Build_Samba_from_Source addr=
ess, two sections existed:

1-=C2=A0Using an init script to manage the Samba AD DC Service

2-=C2=A0Using systemd to manage the Samba AD DC Service

I must do both of them or just one of them is needed?=C2=A0It depends on my=
 preference?

Thank you.

