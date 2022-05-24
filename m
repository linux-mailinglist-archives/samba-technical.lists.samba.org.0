Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607E532C4C
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 16:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZdAo50uziDKOmdl4gYkYPeorA/dmKJMphoaBP4d45x4=; b=4lbb98qWUXj7KFPtmOf2GjUuu6
	rPwAA9wuNl3asDmpc1jhUKk1GMRi17dYjEKZIVVUjamfhI83T2WTNcMVKBLYjrnEK1bF/J+cZULbK
	JoLffjiM8VdTTMv10iTeCY9PqTrWcpTmi6cFtDHCARhsDGEqheFGdZIiL8OELErvjmrUuOlpV5gdc
	Ox8WLiJq5oPcT6Qk6qymixC5+ubQoPepPclriPCJC89BO+Y+NTLRiM8M2NBAM7fvNbN9lrgkk1qw+
	IIn/lIN4PANYMwxcLJC85mhtbdcssJrIe6sucy9YJmNmdrghz/VVfc1kJljuIyhsBudGPp+yIHiK6
	KjWHi6KA==;
Received: from ip6-localhost ([::1]:26066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntVbb-002gnm-Aa; Tue, 24 May 2022 14:33:51 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:57859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntVbW-002gnc-Bi
 for samba-technical@lists.samba.org; Tue, 24 May 2022 14:33:48 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 376CF40AF7;
 Tue, 24 May 2022 17:33:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 23D0112D;
 Tue, 24 May 2022 17:33:38 +0300 (MSK)
Message-ID: <879ec765-7238-e0ef-fe81-d8599101448b@msgid.tls.msk.ru>
Date: Tue, 24 May 2022 17:33:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: samba-tool domain join segfaults (4.16)
Content-Language: en-US
To: Alexander Bokovoy <ab@samba.org>
References: <ba1a680e-f971-1306-ecd0-4d52520ce7e2@msgid.tls.msk.ru>
 <5f1b93c0-6a44-20e7-01d9-2ed604ad3c88@msgid.tls.msk.ru>
 <c4fc41ee-38a4-eb63-5db5-c217654f6a2c@msgid.tls.msk.ru>
 <YozrhUpQK9eLuovA@pinega.vda.li>
In-Reply-To: <YozrhUpQK9eLuovA@pinega.vda.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

24.05.2022 17:28, Alexander Bokovoy wrote:
..
>> But I wonder about in.debug field, - I'm not sure where this
>> struct is defined..
> 
> It is defined in the libnet_join's IDL file: source3/librpc/idl/libnet_join.idl
> 
>                  [in] boolean8 debug,
> 
> and boolean8 gets translated to uint8_t in the generated C code.
> 
> Since Python API really needs 'int' there, we need to use local int
> variable and copy its value to &r->in.<variable>. I wonder if other
> places are affected as well.

Yeah. I already created the MR for this, - using local vars here and in
another function: https://gitlab.com/samba-team/samba/-/merge_requests/2544

/mjt

