Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C336B8D5
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 20:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=iBKpirH2Oly+x2Fky6FCBP0w/K4lHEPJojSJkUNZKFo=; b=O9pyAsU7etxAd7N5zfVGIu5E2q
	aCzwt7g8kGgMsL7tjwLiAHTC2qRbSJyyzidhoCvREiL8fmpi0HEAszkDmHbocl3GUZdHQue5tI5Db
	kVdvBI0Fo6Z1WnCGbdl6YUnloEp2OjJJrKM7lhyURGWEOKiJuaaysFvt9ka1rh4SWUwHdr6yzzY3y
	7FKNwC0uh0vB/nn7nZd76OVkthuKOIWjKpEjFQXhRB6jhvs8bRcb9l4LK5S9hrF4CvPtqxZ9xaKpP
	mzKnyJ235R9xcnKFSJNuYB0YZs7E0Wi+S/USZwARBn/eGbyuvcRYdr5YT1zReA4KOQvQ44evUNDuD
	iS/WTuiQ==;
Received: from ip6-localhost ([::1]:24656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb5ru-00CX27-Lq; Mon, 26 Apr 2021 18:22:02 +0000
Received: from sonic311-14.consmr.mail.bf2.yahoo.com ([74.6.131.124]:45662) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lb5rm-00CX1y-Rb
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 18:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619461309; bh=iBKpirH2Oly+x2Fky6FCBP0w/K4lHEPJojSJkUNZKFo=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Ns5b95mzOBneM1EtLiutIyn3F/1Iax3yskKLFeGbz3rxZ4T/fa1/HFEHZvt4CWfzhFwaLvQffdOr+Xoeel9U+j2zKeXvcMRG5rIqp+9X3Z7PoK06jabvVr5aX3q1Ti5p8+z6XFmHwZGcPzGyMICcfZj84IW5eKyUADGUMEztnZNZtES0x1y9c5l7iNZ2OawM5nA24JgtUtWmab+t68WUumpwDtwBtinVbVqfOncCFoo0f2g46/X0ZCMecgryZLRhLJLoEksxOSMVUr/qqk6adTbysrhDXyYLszzN9Z/CkEFi7JtF6HPtIkqIhRoqnLczNYnYTCKVGEE76c5cXW3f+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619461309; bh=45jewHZSNosxdAWuE6hhOqR/ofgBEXLbV+K6Ak8+qEQ=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=SaUJdqFFiNC0yKSfFswhKpKTezswo0vrLQPHxonZzPU9WFTtcXxtA3hGszGJGLrB4oViSrsb4u6xZNra47LOfTtU6j4MiO6v6yb4aag8SGgSH7FIifo54i67nKC1Nuld4VLeMBwo8hWxHxz4ftxGhDASZA8VC3hyS/pjBxQd4iP5SVsLEWyeNq++noGCuslEGWXx/+kvFwAqPY8GWhRJCCVAWy/euCrGyxxvPaHXXbSv/eHea519A8ING++AfNGR33f8uGbs7wSIBg2FLZ/yf7OPPeFOSiw0prU8tPeXRK7/bS3WGNbZ21TbE1ioPi+geHAgWXQA+qniigmXPIjsog==
X-YMail-OSG: VDKYspQVM1nK3IB7KWzGZULavEOMf0CmnTvDm1uh7xdhRvWqX4AfKcUb20_LpLM
 96ZQpXxvIIhd.g2svOtjqpaszQGXpp3lpLXv04ebcsGoisTbMRJSrLojtKZroT2xmD2BUCn.3G72
 JYPF3sCebtvY.vn2RF2yrjP8aTlg7JC9R4HDnkEmdtAiyUFhkgzfIjO4c4gNp9IMyLu2fRmuWswJ
 RCmcM_ssDloYR1kGHRjLypzW0lUbOR_E0pNCqQvrSw_sVNeUsoQzGhKZhQ9_zAQ8LzFsrXWy.NLh
 GkmE5rVj1YpbXky9sWVeEuTqGyaGbmABrDKInPpG7poMt.qR9UlzJXwM9MqwZARdbp_sVSh9DgzO
 arygyYKdSmQNezdLP7ZYJYGlGvCjy7hqrGbfy3tSdj2l.QL0.G4hwwWrQ8XPBXSjykqyWGQ_5FBm
 _RKDnm0grm8U3cPwgybkfH1cTYaWSKNus_cFzbZnj_bJp9jUU2SJ.z3dPw6el1b62xz5YXaw0S3G
 xpZl5CwBVivf1YkZpe3pD_jVwhg4u04aio_YeWPLAEu9rO_U2Zz3mHUcitLHm4im74xo3ACvHGgr
 9SkSyMmlIiXL9PRhRhurp581lYZtZg5_l_zjWQRJ2WgpF_EACRopzyqGoiNdFNT8St1mJeIQMPhG
 5nG2KLbkuqgI9wymET19Tedxjwg.mtAP19LixTx483_RKct0d93f9R3VD0_sLxDZ7CmWyR9HgXR7
 xrP1VeEtUemF4UUB4rJa25jmsdCUPw8XNiY5zh0aIuTbFz3M_yJGAisvGUbuuZrnXJ5TAvXl0m1v
 GEC_9vxDVDSOAaBmU28SL0KeWa7e5OqwAjUL7.yXxrBRL3Zw9vqRIcYxVffCaU.oYj7BYuKUJ.KH
 8KHiy14S1KSkQTo0tBw4s.31GAHAhIwYJ0ZVwkb3_3M9JcpAHaifNw4zk95zRHLCpgPo57xt5_CI
 BWeWeLIcR2r7JDuXSXL_7Kj8gENYxFxluJ3HJAtdL3pzbF23ruULit9wPt_dbEtUfHxeIKwgW8pt
 n0iyPF5wUhoudt7W.P1YrlL6RdvTFATWhprhDfy9gk6R2A8TrjuYVI_v_tChTTpj04ZneUM4lNOn
 0RvPynsFI0OojzWSi7PbfP1UzgJdHtF8Q13elpnoiqYWOaJXwpkh.g9AIJEZdQ50I27sveW9_Ued
 kWatCBUPpaMzYt7xsNq5UX75Gqpe_PmFdP7XrOn2eNQ56YcnLwxT32z5hwiP.QJqRzQHhoEcyv81
 6WbiDnTECMMH3Mv2PYBwcYpfLeKfcnEwVCX5PFFn9FYAFBIG0U4QdfuUMrejYqgKgkRbcjIez317
 ZTzYGSf8pWu4T.6lp.iCc.SDSpl40PRv5C6iZoeKVLe8KeWjporI0MXEofELKHkbgASF4a8WMpSl
 SW8Nh3F9UrjFrquPL9EhxRObbwj2z9OVFlkUsXtT30Tj2rIWQpYvSzfbTigqlICN24LtzqMPycwZ
 qa9dG0ddhm5Bqvw4bjcD4OcWP22vn32MzNi36VeGW.v18gXndunPLfulOawBVLiWVK1J4WA2k08G
 .62VCCsUcGfjIzJlQy.JmTmSr__GsQOjmIzTLOLw.o0kp1buWgo1MdcNvwYPHHozfklplG8I8y5f
 hitsXqxZfzSRgZg1mCUlvMuunr10hvAKXoTr4pWkrygGKm7KJezf2idanVcNHspMffX2ZW0T9rCF
 ZD76eBpMalFZ71EPkXuP_mXX3_TCpsdwevIAtOe0hYgM5gBWHWT1nbqsMZAXUT6ArG7GYxmpMZkK
 2Yn7GwylJe9rMqeV6FsJmVjDP3AP49fLYXvh.FBf8upfzEArf7wSNpks1JFm_HIKThi4_RU22HQ_
 sjjYM8Nes_u4BJSFHgdkMa5pi_5Ewv7zDkbXS1b_kGs3qvq8ECTz177iymf1ux3diIIMu7WYg4GG
 7UVWgnNKJlOQTVlGwzYuUOqn_HNDnvNNKAAXFqTTJTM.DfxM9fc446kvui7NJ6tQB1mYJcPICTX9
 xL_8Q0vuAQ4ByaZXcTcdhl2_LvakvEjeFWVqdTbSjcwMnAv480pB4mkxDtyb01VibN6sK1UGR.CI
 EH_fmywtV.aKoldJr0U.9q3g9Jik9ehdfwjXApyfJYE5rS0uiMamyo4YzpqxZPNxdq7vbde_FjwK
 jdzjo_15TxDLMeXDPcGfTA6JCw8zGtfTvxff4RbKe1CjdhiZvk0vsKTJA0zAhQ7OY58S99xvvFKp
 BSVjiVEsD7aDQHTGBeeiY0rHnTnHubfQpl3h.XPRaBfwgxzlMeCJpG8MRqmatWyLdkoLm3.DOGmi
 QI9QKbOW2GawovRXlz2VJ90fEh8H6OHcSb_iG4zpzS13sjVYDBvGVvqQwBUxqMWD7EKbM1CtqQKD
 oOA0i.S.VvvsC9QZONsNj9A9TP4Pgo5RH16rN8m0L_56BcJDmCUaYuGymK_CskPMlFtiFRwnjfd1
 1BrbSdRGTWWmTXD6LbLZKrLLh3.DMCXlISYzNYUactu_QrnAlxgR5hCt1wfQ-
X-Sonic-MF: <hack3rcon@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.bf2.yahoo.com with HTTP; Mon, 26 Apr 2021 18:21:49 +0000
Date: Mon, 26 Apr 2021 18:21:46 +0000 (UTC)
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>, 
 Rowland penny <rpenny@samba.org>
Message-ID: <1135512558.388994.1619461306009@mail.yahoo.com>
In-Reply-To: <01c0eb4f-a20c-4b6b-a237-375603fad8f0@samba.org>
References: <568442653.399407.1619452357983.ref@mail.yahoo.com>
 <568442653.399407.1619452357983@mail.yahoo.com>
 <01c0eb4f-a20c-4b6b-a237-375603fad8f0@samba.org>
Subject: Re: init script or systemd?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Thank you.






On Monday, April 26, 2021, 08:34:27 PM GMT+4:30, Rowland penny via samba-te=
chnical <samba-technical@lists.samba.org> wrote:=20





On 26/04/2021 16:52, Jason Long via samba-technical wrote:

> Hello,
> I installed the last version of Samba on the Fedora Server from the Sourc=
e Code. In=C2=A0https://wiki.samba.org/index.php/Build_Samba_from_Source ad=
dress, two sections existed:
>
> 1-=C2=A0Using an init script to manage the Samba AD DC Service
>
> 2-=C2=A0Using systemd to manage the Samba AD DC Service
>
> I must do both of them or just one of them is needed?=C2=A0It depends on =
my preference?
>
> Thank you.

>

No, you only use one, which one you use will depend on your OS. Most=20
OS's now use systemd, but others such as Devuan still use init scripts,=20
so you need to find out what your OS uses.

Also, this isn't really the correct place to ask questions such as this,=20
you should be posting to the samba mailing list.

Rowland





