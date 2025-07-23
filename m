Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D1B0E8CF
	for <lists+samba-technical@lfdr.de>; Wed, 23 Jul 2025 04:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=shJZgOfH/10SANSprYFG3VEZ73EdfNorxXuJDwiCffM=; b=ddkY5riwrLPqJSUL495UXRqBsQ
	UqgIBo4sTuB3OlBwXIyMGj2fQAY+gw8kqMM9BiJGmGOdzwI4ZrGDuQXhEpCu9QGTTz8dzfk4s+yPC
	yeBcf25p6LeKECZOS/jdC3Vk9mXkvioZ7keRbUbMZd9N727MjE6TRPuxcwofa0+GJZVSXmkWLsG4t
	7JoQM2nF9vPiiiDkldDRmPoofpykSsQsi3hw1AXzipJudC2hz8xD945qOo5zLTfpN20sinJ/MBY9w
	DmI1Ui5Ge7rmDE4iraW33x8X/ZhjZwe2X8XdaWDeqMC4sqC/pwOXOlDkDIu8Proy95q1VEzmk40sZ
	zGzYr9Wg==;
Received: from ip6-localhost ([::1]:55320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uePbC-00Bdzu-B9; Wed, 23 Jul 2025 02:52:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uePb7-00Bdzn-Os
 for samba-technical@lists.samba.org; Wed, 23 Jul 2025 02:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=shJZgOfH/10SANSprYFG3VEZ73EdfNorxXuJDwiCffM=; b=hgNOvYzOWYOgTEWRAK8Njb7ESt
 8Y1r5EyNKsh5l3IEgmzwjVjZm8rCeUdUKO4/gCQS9ntZbAgbD+h2cPXX+CUfPNOSEOSneRlriLMR8
 diaTJVqwtupPpOEoemaRBn/gNVt+hGv4JI5Nwmj/hpGl5+mAR6l86JARDSiNu23spJmUz7Q28YcCF
 cIhqwq0+QGgoIGaFz6N92VUrNJbvfK2jViH2C75c4uC2ahfUC5mhCJFfdcAIrXf8ovxyPcWS+3vXY
 DtNdeoCfYxscpqoQr2/TNKwqCbQTM4Qm7flw9RwsDcohPMNeNUQMUFBD4Ln16t4YIjtHtNAyrqnN5
 EM+gKnNUVMqmoDafGOI2hp2pyLz5c+vCe7HGfjGArN45jEHyED3lDWh21OlI8/jtmhiCnddQX0wKd
 EpMLZgeBERjsUnA6FED8aZtSlL/MZpdCL70paFtXM0mnhqwBTvjnN+OuXLr7nWqloObujaMJIXy/1
 NXTpYDq6oho/9B1QsIczDRrm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uePb6-00GXLu-22; Wed, 23 Jul 2025 02:52:49 +0000
Date: Tue, 22 Jul 2025 19:52:46 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: smbclient posix_mkdir over SMB3.1.1
Message-ID: <aIBOfm6OKYlATpAs@jeremy-HP-Z840-Workstation>
References: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mvaM2Fuytp9DH3RahQ-W_mQPpi=GBuKET6do1pmyiWT4w@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 22, 2025 at 04:54:29PM -0500, Steve French via samba-technical wrote:
>I was noticing that with current smbclient (master branch) most POSIX
>commands don't work when connected to current Samba.  I see the
>SMB3.1.1 POSIX Extensions negotiated, and in some commands I see the
>SMB3.1.1 POSIX create context sent, but none of the posix commands
>(e.g. posix_mkdir and chmod and chown) work. After connecting to
>Samba, issuing the command "posix" succeeds (but doesn't send anything
>on the wire).   All of them fail with the following:
>
>smb: \> posix
>smb: \> posix_mkdir 0755 dir
>Command "posix" must be issued before the "posix_mkdir" command can be used.
>
>Is there a trick to turn on smbclient allowing SMB3.1.1 POSIX/LInux Extensions?

Try this (completely untested :-) patch.

diff --git a/source3/client/client.c b/source3/client/client.c
index e96efb9ea23..d0ea3a12667 100644
--- a/source3/client/client.c
+++ b/source3/client/client.c
@@ -3173,6 +3173,9 @@ static int cmd_posix(void)
  
  	if (smbXcli_conn_protocol(cli->conn) >= PROTOCOL_SMB3_11) {
  		cli->smb2.client_smb311_posix = true;
+		CLI_DIRSEP_CHAR = '/';
+		*CLI_DIRSEP_STR = '/';
+		client_set_cur_dir(CLI_DIRSEP_STR);
  		return 0;
  	}

