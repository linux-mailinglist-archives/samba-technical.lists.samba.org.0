Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B32243B0D88
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jun 2021 21:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fWM9zp73Lx3Yw8olCe1fLei45c9Nk1DPew7DGe78aXk=; b=i2DzaBsTKOknSPKVVEGOrTIbo8
	xUe+aPwUIYRJiHU+hqt6toOlMUV4/zX+5GQ8/T6RGNilJSTJ53uXpc8ldgJO1caBp6/D9PjaJAgJa
	LYVBNJNEGSdeTbWcqt7UHhqDpo18WPQOkgYNU2TXYFa9moePpav4J6NiyC6pyJEgRtyTIC+YFxPwV
	8jT0E4ubhH4X4W6pvmD2JrsGpmqKR3GjYBXSfbSAa0vWnspb5O/V6e53nW7rW0JuALv5kcbMo5Tm7
	C9PKTZEWeuAE77dlUmT/jk7Dw/hP3cvABr5eVgTf6zqijovD6yvkjbWZtVUfIzA4gJjOYxIcQkS7c
	+o4B5r9g==;
Received: from ip6-localhost ([::1]:40708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lvlrw-007g2C-8v; Tue, 22 Jun 2021 19:15:32 +0000
Received: from p3plsmtpa06-10.prod.phx3.secureserver.net
 ([173.201.192.111]:49669) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lvlrs-007g23-2n
 for samba-technical@lists.samba.org; Tue, 22 Jun 2021 19:15:30 +0000
Received: from [192.168.0.100] ([96.237.161.203]) by :SMTPAUTH: with ESMTPSA
 id vlAslttD2gDYwvlAtllgCt; Tue, 22 Jun 2021 11:31:03 -0700
X-CMAE-Analysis: v=2.4 cv=T9xJ89GQ c=1 sm=1 tr=0 ts=60d22c67
 a=Pd5wr8UCr3ug+LLuBLYm7w==:117 a=Pd5wr8UCr3ug+LLuBLYm7w==:17
 a=IkcTkHD0fZMA:10 a=NKnj5_UAaIENT9y6Z7kA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: Processing ASYNC responses
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
References: <CAH2r5mvUXZtY3=LNzt8_icDfUAAeZpzjUK3sEErzpCksFDX2WA@mail.gmail.com>
Message-ID: <bf9d559d-e309-aac2-8406-e151453d8dae@talpey.com>
Date: Tue, 22 Jun 2021 14:31:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAH2r5mvUXZtY3=LNzt8_icDfUAAeZpzjUK3sEErzpCksFDX2WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMoWcvHFjVMFEdBczZtpB1g1eSHNVQSEu0ECuOnqrCvvmFh86P7lpZDaCJrKcJXwoSy7mujTE5BOC2S+w/x1muYvzZ+V4rUKQ4kAGWjMiRV/dIA6qGUD
 2DC8JswP8OstB1YmFuJAe+xlXLZRK5dTRSQinEAgNl12FBXRpFW2tKequAx/VAHc/8EY9t7DTEJRk0c/cOT82TrDNdLFbWw28xam+LVDkeL747A3ezgLWCAK
 iCh3fDzWh6MJ/gdewo5uURQ73e6Y82m3K1VrHlIR/mRh+DWbDzQ2ed/Ek0fsX33VVORLSdagLi5AIcEhAlKuY+MYZCGOFfSpj5qFwXf3qro=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/22/2021 1:45 PM, Steve French wrote:
> I noticed that the client isn't checking for SMB2_FLAGS_ASYNC_COMMAND
> in the header flags field in the response processing.   Are there
> cases where we should be checking for this?  See section 3.2.5.1.5 of
> MS-SMB2

The header format is different when this flag is set. Looking
at smb2pdu.h, I don't even see a structure declaration for the
async header! How/where do async responses get processed??

Tom.

