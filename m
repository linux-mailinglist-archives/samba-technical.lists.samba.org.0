Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 138042567F1
	for <lists+samba-technical@lfdr.de>; Sat, 29 Aug 2020 15:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jalDjl2fdZGIBkecpnW9hLPWJqPWZ++0CLfkgEqJiK0=; b=sIdmQKI0XMhXiQTfjYk37KrQDs
	BGdryloGGyjJrLsKyLTBPG/NomKxxn2n/TClYCF/jEAMLC39hBJdoTQoOH9X6c5BOj9uvg74bUexd
	0LG9t1XTiSix88SiTMgvdhFRsmSxN0diogNZjNcZo7wFDEwCggYhkQMB1Wng5IqIzw7m56Xyr9+q/
	oMdto9WmL9HWNRRyVAqABDHdpZong45+zNd19kj9S9Aryk+pgdnc+b7Rx5wPWP+STno8kSiPrdHdm
	QMnW2YrKYLZm15K67sPiVBZYihD+SXC2kEC/Cd3xhRCwyPNRAyiSYkvBZ9DzLLmxl+8UawMArEV+P
	OgqlT7xw==;
Received: from localhost ([::1]:40254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kC12X-001ERa-Sz; Sat, 29 Aug 2020 13:37:05 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:56810) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kC12T-001ERS-8n
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 13:37:03 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 2A591D533D6C2
 for <samba-technical@lists.samba.org>; Sat, 29 Aug 2020 16:19:56 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rTAoCRSKZCYD for <samba-technical@lists.samba.org>;
 Sat, 29 Aug 2020 16:19:55 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id BDAD0D52477EB
 for <samba-technical@lists.samba.org>; Sat, 29 Aug 2020 16:19:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru BDAD0D52477EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1598707195;
 bh=jalDjl2fdZGIBkecpnW9hLPWJqPWZ++0CLfkgEqJiK0=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=M43MRAnwV17GO6NYRsY/7YLGEObQNU2dMStiYaqC4hAT2m1nFoal0ey+J4grku7vh
 HfHtnh7DesOR/Qn0c0o1wn9hlz7tftT1DQxl1WMUwDJ6E1+B98kdalksFKh7oQITUR
 2rXAudzXb4NqijET2CC/lnnEtBc+NkVV4FsmlIL68htoQa5UQZbj2372pbztdL6lUx
 AlUadBH9CrzQqVKNHJtm7UE5bH5a+2OfsUMg8uwOQuHbOpaBgY5nbOr+4SJfZxzmsa
 OCaIEWUF1FSUt8puhmAXURtgTN5WZp6bFVKXd6HVAf0chrxSN17vRtQp/vDHYfCQhY
 4vLz3fyJHxe1Q==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bhPRZaGa05mY for <samba-technical@lists.samba.org>;
 Sat, 29 Aug 2020 16:19:55 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-182.ip.moscow.rt.ru
 [90.154.71.182])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 9824BD4F545D4
 for <samba-technical@lists.samba.org>; Sat, 29 Aug 2020 16:19:55 +0300 (MSK)
Subject: Re: QNX6.6 cross-compilation problem
To: samba-technical@lists.samba.org
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
Message-ID: <e8d35074-3ca9-5895-c209-65017cba0197@rosalinux.ru>
Date: Sat, 29 Aug 2020 16:19:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

14.02.2020 12:17, Nicolas Pinault via samba-technical =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>
>
> The configuration runs till it hangs at this step :
>
Configuration hangs in 100% cases when building samba for i686 (not cross=
!) if there are more than 1 CPU cores.

I am building samba for i686 in one core VM because of this. It happened =
with v4.10 and happens with v4.12


