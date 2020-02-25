Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E5216C3DF
	for <lists+samba-technical@lfdr.de>; Tue, 25 Feb 2020 15:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yYqyeuI/of9A069uFI42HcoeZJ+YDh489i2p/gem3KY=; b=Bgo0TJavE9PSzRlQPykvGv7eq8
	vOIt6jjBJj3v4Sl5mIIJbOxQxFSejlmxW8FmvEfi8aguFIF4G03c6cbyvts26ovJ6aXVpsX0Sp44W
	bKw9jQ795zs5FJkGH188Yn54y8Jd78r/vgIapXGuLbM1MY3k5yIE1tRuTgJlrSc1WIgvtoURj/En6
	24kouj5KMMCQ81pDMC13gwpqxvgqpY2AO001g95Mw4kBz9T01MbSyFHJ5v/vJjdAtTYPLJi3XvUlu
	Vf3tPQZaMreF47peYcpYmFKxbZPbRKz0Yuqs6mb2BTImMMiqkTxLFyvwD+6t3gh0XLfEU8ChT8s8+
	MfHazAKg==;
Received: from localhost ([::1]:36666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6bB6-00BdIg-CJ; Tue, 25 Feb 2020 14:27:16 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:42437) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6bB0-00BdIZ-Pe
 for samba-technical@lists.samba.org; Tue, 25 Feb 2020 14:27:13 +0000
Received: by mail-ua1-x930.google.com with SMTP id p2so4559948uao.9
 for <samba-technical@lists.samba.org>; Tue, 25 Feb 2020 06:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UDupd6e94gZGRB2bo+o9sF2jIpCp+v1uoAJkJ/i0uDw=;
 b=can8lfNBG5m7jXRKIZMh6tppap5kSz7x6T9WFCQ7Qdi56dY3xGTD+V+AZsIzxuM61k
 pzGt5W0RK5z6sSXDj3Owds+O7lkXNmOVLMlz6bafHVLoocHd28fEgS9imaaY2IveNSjA
 pJMwKvWkELx1/atFPka2UCXk2hoUf0h6LHFS5J8Tu8Z4EQJX0YAsIrCOw6RanUxM560j
 9BhGoS3o461ANMDKOdz6uQuq9xtz2HrELjOPqklioLLVWCPg2UVXGX8IB0LzvQXMD3hW
 1af/0yF3tKGIdr6JzgP73B/UqWr+TJk8heaUzWHqpN2dFIsUj32Ha8Vi96gGuBghZjd/
 plFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UDupd6e94gZGRB2bo+o9sF2jIpCp+v1uoAJkJ/i0uDw=;
 b=Q9sAzC6fmdA60B1lLVWaPENWjz4aP9o5ZEEtC1gDEXWF8GakZcduhbl8jy3ryR1GIn
 cP5goojVdQhQKHjfwUqrgEbHVeqF1os0vhxAyhZ4ARvOCuMwWyvGthdbRhxc+Vz7HEBA
 zNxaABNcYgajEgEw6mq4C4rI6KBGB78BM05jNRg5deYVpgnVLOO0k1FHaJxzKPKvzz7Z
 aK3zySWklg3T6YwH09424guqyKsGmi0XOx+wmnqchJQlL83lpqHWXi92AckGx0GwGQfH
 xdfwdJovUfwGBhWPnN+5mrdcmGYHXTSCO2PIg+PuUfHgs0S6z53XIAOcytSUL1NusVAA
 laOw==
X-Gm-Message-State: APjAAAW8QmCHJXP4UfnW01WXMzrOjVLhndAHEjeZYSaqeQ4pHbZoXHF4
 8it3vkEvwglkrhBd14f/erhbRx/JEHZ1XZoO5URUJHNrQF4=
X-Google-Smtp-Source: APXvYqwLd5EVam3imjS3NthFaC1BogwN2pD36anPA/KxyVRaGkmXPZCD2GnGscnvItOqn422HT8d2wCKk8QfB/EAolg=
X-Received: by 2002:ab0:7792:: with SMTP id x18mr28094945uar.116.1582640825148; 
 Tue, 25 Feb 2020 06:27:05 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 25 Feb 2020 14:26:51 +0000
Message-ID: <CAGYhc9ks4Fg1tYxb4XrK92AUuyjrPpO17aBVcdJUkX_dLJ0Acw@mail.gmail.com>
Subject: access denied for network sam logon
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: moore chestnut via samba-technical <samba-technical@lists.samba.org>
Reply-To: moore chestnut <moore.43132@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello samba folks,

I'm very interested in network based logon ( netlogon over rpc over tcp).
Have been doing alot of reading from the hack samba page and code browsing
per the recommendations on https://www.samba.org/samba/devel/
Also reading
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-nrpc/ff8f970f-3e37-40f7-bd4b-af7336e4792f


So to simplify things for my own understanding, I have created a client
with the sole purpose of netlogon over rpc over tcp with view to do ntlm
pass thru.

Here is a summary of the flow.

NTLM enabled browser client and a bespoke http server.
The http server is a machine that I have added computer account to MS
active directory domain - essentially like torture_join_domain
The account flags is just set for ACB_WSTRUST only.
cli_credentials_set_secure_channel_type() with SEC_CHAN_WKSTA

With creds for the http server machine, I have been able to use
dcerpc_pipe_connect_b() to establish a schannel.

all looks reasonably good on wireshark per my reading of the code and spec.
I can see the epm and server request challenge req/resp and server
authenticate2 request response.

I can then do a ntlm handshake with the client.
Save the random nonce from the generated type 2 and get the LM resp and
NTLM response from the type 3 message.

These are then used to build up the netr_NetworkInfo and
netr_LogonSamLogonEx and call dcerpc_netr_LogonSamLogonEx_r()

But the response from AD, is access denied.

From the MS NRPC spec, it says:
3.5.4.5.1 NetrLogonSamLogonEx (Opnum 39)
"If the server cannot service the request due to an implementation-specific
condition, the server returns STATUS_ACCESS_DENIED."

And in section:
3.4.5.3.2 Calling NetrLogonSamLogonEx
it says:
"On receiving STATUS_ACCESS_DENIED, the client SHOULD<104> re-establish the
secure channel with the DC."

The random password for the machine computer account has not changed. Would
there be value in actually reestablishing the schannel? is there any known
subtlety on AD side?

Any suggestions on approach, methods used and the access denied?

Thank you.
