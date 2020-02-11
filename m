Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5B158CAD
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 11:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=48fBP/dH8IjfRRh37UiTOh5OiO+NfjS7Xpc0aKsZNDs=; b=vNvt03pctK8eWL0OMDahysqW1g
	ZEzkwKvNSfAne0npCFKZxXObzUVf79Rk2DB24FN/WykhhfhMaBEHPC1unnGo6vaiQLyJZsrYQ/fND
	HLI7U7Q4XobqJBNX8wX+CwsoyFHxmuR3gObDhx7cj+zaehUB7FFMRJowU920Qqo4oIv4XAJw5TPZH
	TzMThX/ZGPKUg97D3Q8P8ToATCOBfHjQhxmjnc5xLY/32Z8HKP1fOPCVJLL32kL49ePHOwFGaLywU
	jxQ6Nnmxo7r4O/6YwUrIuvtJAf/ikISknRLqAzCEZWfJHaJ0s+s56JyY2oT1SVrfAOQ0w9PC6t+K4
	sEYJmIWg==;
Received: from localhost ([::1]:55672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1SlR-009Lxd-T7; Tue, 11 Feb 2020 10:27:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1SlN-009LxW-4T
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 10:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=48fBP/dH8IjfRRh37UiTOh5OiO+NfjS7Xpc0aKsZNDs=; b=t+X9igATUowidu7w65Ws1pXXIC
 fLmfX5uMWI5cLTqWuqj54DLbw9za3Lb9Wml4hdVGdsxImkSg59EqGQxnHOscFyHnfIzhN2zz/OHml
 IWA2MguJ5Vt6n/ee55NUWIX6tiIMevqK8FzDNO5K3ypXCkHd3jP/3TVTvJs1YhLxBzWrTJVP9ysXE
 3protL2/Y+o2uqQ0j7golvgOmbesafAYIbNeRmBByPUiqOhXfX7q0b8jYP6M8AfhUlFo914AgvZI7
 iOKO6UCoC8VVCrdaPaS7dLadR7iBDU2G1M5ybUTiRAfCSsn+y4KHVQAZX2iV5Ki50pN/xsAvB8B1K
 3IfMdPdq+g+HoaxlFZQ7wpaA4ETHT47QjeffaVq6vW3uEoqnw//eWxbC6a9sHOB1zyeBe2pnViE5o
 k7of1IrAWBU7vEiAdAK594FHueBemGNiRCjl9lv+0Sfvb3jExyjavU87txvknUkHofPT2j4RCLHFS
 s6P3PF89bR7au4/oKRBm98kK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1SlL-0003dR-UK; Tue, 11 Feb 2020 10:27:28 +0000
Subject: Re: [Proposal] Remove dns_sd API
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <B14B9A04-A84E-4DCB-95BE-E029378E49C6@gmail.com>
 <20171105085753.axk2m5lsdjns6u37@kazak>
 <CALdFvJGSw9WSm9UtAB32Nqgt=4qA_whai15Fo9C6ypspdKQt5A@mail.gmail.com>
 <20171106094708.ku75kutkm3s6i23c@kazak>
 <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
 <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
 <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
Message-ID: <1e46dc1a-5e03-6df0-5fb3-15ff1ce00ed7@samba.org>
Date: Tue, 11 Feb 2020 12:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 2/10/20 um 10:16 PM schrieb Andrew Walker via samba-technical:
> This is used in the FreeBSD port for samba, and is currently used in
> FreeNAS 11.2 (though future versions are moving away from). We can work on
> upstreaming the fixes and time machine support if there is interest.

in your own interest: yes please. :)

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

