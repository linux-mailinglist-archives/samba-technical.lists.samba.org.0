Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B72CAB845
	for <lists+samba-technical@lfdr.de>; Sun, 07 Dec 2025 18:31:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qdqwaJWsG+mSUeSP+RDo/7Pp7V0Ce4LJoo/Ts62b5jI=; b=Fll5y0NYG4D8ojA85Vz67ThuMg
	D7FELi86wvEbybYXrm+EUeHoyIz7RhlOKeX1GrPHLiXKdPVub1osPVXzY4ngk3CZt4j8Q+DX/yGFE
	SYfQTqnV69kefGQTX6Atja0/VpSJmUHKcRofxk2nCfuFnfYckZi82WF52AUtzdQ+wh/ZReSIA8gwd
	30OIJiSarm5c/xY6I6ck+ly3cyP1LeDOCi0jNCYyoKCwQsAzNKOrRB3o6IfXNmSLxpXXz1qfNCWG4
	YQTCA2SxxaitO6APXg5i8aqWDIRNyRvQST87Owv2FNDJ0HfIHzxQadkjyT/tgm7x032oGJTjutUyR
	N0Im2qMA==;
Received: from ip6-localhost ([::1]:54620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vSIb9-00Fqbb-Ox; Sun, 07 Dec 2025 17:31:04 +0000
Received: from mout.gmx.net ([212.227.17.20]:42135) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vSIb2-00FqbQ-4L
 for samba-technical@lists.samba.org; Sun, 07 Dec 2025 17:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1765128653; x=1765733453; i=j-p-t@gmx.net;
 bh=qdqwaJWsG+mSUeSP+RDo/7Pp7V0Ce4LJoo/Ts62b5jI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=oOv01lwhCVYZw3R5RujdXTkyo6ktxFjXTAF3/n6Ov7ro9PLFn0i1qT9kbh0YTYsV
 U/hLgukyhZ61qqGnEPtBivGdj89aexgEzfyVmCx26NphJSimpT9AuH9dO+EEwsDPb
 qZutMON9e9B9zvTBr7VRAIVYTJ6K2bej0zSpQkI4pMMTW/8P+Yb7ohq381ZP4L91l
 UdhKb90BTUYTBdD9fEt8aCKTWdY2bWaFtYhtV0YV5Xf9zmTve/ToviXxM3emnkyvl
 UI9PzCqHe3jljUntsGUsGky5QVGX0BgYnqJD4zYtV7Ee6CH6HXxj6RRqnvTaXnHVs
 KQndGp90h8+25aLCmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.58] ([5.61.144.172]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1vz8JJ1Owq-00qevE for
 <samba-technical@lists.samba.org>; Sun, 07 Dec 2025 18:30:53 +0100
Message-ID: <4c26f3d5-31ad-4932-b02b-7521855dbaff@gmx.net>
Date: Sun, 7 Dec 2025 18:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: How does the SMB handshake work?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HYUWtFGdQcP6KCzAZYhSMjwHxPnZqaLy8HzmRsW3LfPqj8y8i+L
 yECagDEx6m+kRiPJsQreofRnQqx2/VAupfJ1+5PA1Yq3a94UcrP+D6Ht4lPWv+ztKiV+YKq
 c+mzl3/9SokzSZlh/njqovJnu+6bPMnnTz3v2+csnOccsepgZKbNlHVBviyVTI60O3CH5K2
 pCCWEwlnaxonMFnLj/Log==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:upiTEatnIrE=;OamjaJtcpxahPdolSLot34wVpsJ
 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
 BJ3zQ==
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
From: JPT via samba-technical <samba-technical@lists.samba.org>
Reply-To: JPT <j-p-t@gmx.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I am currently implementing a SMB-Server using=20
https://github.com/TalAloni/SMBLibrary

I am slowly getting to a working server.

But Samba client tries to negotiate the features and I just cannot find=20
any information on what is going on.

samba sends:

INTFileStore.DeviceIOControl(handle=3D(null),=20
ctlCode=3D0x140204(devicetype=3D14, accessmode=3D0,=20
function=3D81),inputLength=3D28, maxOutputLength=3D24)

the input buffer contains:
FSCTL_VALIDATE_NEGOTIATE_INFO request parsed: StructSize=3D0,=20
DialectCount=3D0, ClientSecMode=3D0xBE4D, ClientCaps=3D0x48F4C728,
ClientGuid=3D2a997584-1896-3636-0100-020002021002, Dialects=3D[]

How do I find out what this actually means?

The AI created an example output array, but it needs 28 bytes, while=20
Samba only gives 24.
The AI says it's called SMB2_VALIDATE_NEGOTIATE_INFO_RESPONSE but I just=
=20
cannot find anything on this name or how the output array should look like=
.

Samba does not increase the buffer size, instead it just tells
tree connect failed: NT_STATUS_BUFFER_TOO_SMALL

any help appreciated.

JPT


