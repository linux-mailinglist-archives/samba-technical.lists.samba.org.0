Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EBE225C79
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 12:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pCscTJifz2UNpOwrOvusfs3PPiGVizOpFmA+hTBMz34=; b=jkf88CZmLTyQBdUYCpCiCkcf3x
	oSUZdJdNBI5VkK60JuaFudoZY2kDrRlucZwTFu9z1jwOfo+kJW448x8g50xti7CaJzJxAtkqdrlCU
	+TQrNzjGmm1hfmusGgJm7U9tMdVsZFWCrTuL6+210ZC+scLNr2VDggC7+xmruUx2PdMhq0bL67MI2
	HzIBJF29YR0E5jV5uNDrm/3cvv3wUiwj/kIS8BxD3b0+lk8OsHjdb54hb1TpGCWV7LfXV5pWMeS4N
	+5crsf2JbAJCXcRvdt8IUENoMxmuKAiYn9NxsROTLKT68DE9kBjyG6ic099KIukVR57fpjXcu7qbw
	EjOHr8rA==;
Received: from localhost ([::1]:32874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxSo2-008n6Q-0G; Mon, 20 Jul 2020 10:13:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31332) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxSnv-008n6J-Dt
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 10:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pCscTJifz2UNpOwrOvusfs3PPiGVizOpFmA+hTBMz34=; b=yFOhqs+DO/dYGk0N/h1iRHwEXw
 BScz4yCJ38SuSpkg5QLSBT44t0O2Y0J5bfNWoSguzeundJBN1x7uNmq3wO8OoPMaFtux1nyI21BZJ
 c7sg18JJiDo9p3yqO3E+y65uz8O6gnpzGVfk36hefvbIFzKRkBuRfHHLit/Lm19TueSrqvQMSlL2Y
 0g9HB9/ngZJ31ltaLAN2lKBdVNJmS6rI1ft2dGDuArq2pOrKvn0XrTwAHC3ykR87V1/mtwa382Ecg
 atyiDKKV3V9x5XdhUu2XK0HvYZ/xYBpFIGp0ObfIubGhF5QsQy1Q2rByZwhFF8da1Xki3Q61ljIIs
 ylK/KJLHr60CHBQgaZBNGsC28sQEzby0rvzig4kn+V7d9Dh38qckjusnZUHv3FuympLZZijamBiUm
 WOS7up8W2G31M6GCPacizosc6aY/b7L9kj4lX3GhUefvCebinW23OoPI6j+0R3C4vPh1v1rTPdcsA
 XGUJ09JOHq8pSVR2Yitx0RQU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxSnu-0001EM-4B; Mon, 20 Jul 2020 10:13:50 +0000
Date: Mon, 20 Jul 2020 13:13:47 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020 Progress Update
Message-ID: <20200720101347.GE25598@pinega.vda.li>
References: <CAH72RCWDx2Qsn3jo8_hAMC0m_8VwDHxxvg6JL8mwdEGR5TxN8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCWDx2Qsn3jo8_hAMC0m_8VwDHxxvg6JL8mwdEGR5TxN8w@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 19 heinä 2020, hezekiah maina wrote:
> Over the past two weeks I have been working on the following:
> Packaging for Debian and RPM-based distributions
> Domain Management components
> Delegation Management components
> Service Principal Name management
> UI improvements for the application

Thank you, Hezekiah.

I haven't tried to run the plugin yet but the changes look promising.

I am still on vacation this week, only looked briefly into your OBS
Fedora build failures. It looks like the failures happen because OBS
tries to build the app by fetching all node.js from online sources and
failing to do so, thus not finding required modules (po2json, for
example).

When I prebuilt source with 'make srpm' and tried to build that manually
in COPR[1], it succeeded: https://copr.fedorainfracloud.org/coprs/abbra/cockpit-samba-ad-dc/build/1565160/

So we need to find a way to pre-build sources and then build the
packages. I'll look into that.

[1] https://copr.fedorainfracloud.org/coprs/abbra/cockpit-samba-ad-dc/


-- 
/ Alexander Bokovoy

