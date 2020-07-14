Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E221F97E
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jul 2020 20:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SKceZQkdNwUccP87D97GoaJXNgIlz6Sj5EGLU2v/TQ8=; b=RbdMlt3ryTxqkGQAYswjJriAbh
	0fMwD/i0QIE9kbi8pd42vGExgwDkSb4JDdBLoYWF53yRj9HsnJLUIsXxeIKNiob9d0iym4vOPKtNy
	nYlHdA434DrzE5MPlD/4ISaWW8sG1p3/J30Cvatv6LgKCpFO6zTXkOKXS+8MsnADHHzOU1ie4/Jnh
	b9T11jswROWtv+cEvD2SLnkkXd9rn5HKYERTamuXkfk7Js8g5F6LZDAIxPk7nscZsYG4hJD/cOzTI
	tJURnpcxZdjLB2QJaF44kI9mh1Ads7jeK3Q3p/vtRhKSE8M6tgkSNZNYUfi2hcVH2GCRZ/Vz7Eo1T
	O5wZXgVA==;
Received: from localhost ([::1]:26544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvPk7-007VSR-7d; Tue, 14 Jul 2020 18:33:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55302) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvPk1-007VSK-EA
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 18:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=SKceZQkdNwUccP87D97GoaJXNgIlz6Sj5EGLU2v/TQ8=; b=K5HVULecNL+ylhFPIW5KheJXEF
 6W7QEcueDs2SnC34rO1YQc9nZQBRhUEjVwTBGpMaKBOD4tP8ElYulaA6O/YPd8q/1EWjAM6lj5/YO
 xN6bN48m2ZgXeSuDKPspe3uflm+0Bi1JA71vv6ZV99Sq9iz31zZ23CJIB/4hzM+WhKN9H/S5W5203
 cTKZAUUcwaXGE3G7gBw71tGJ6EaMzZB+STM88njchWcrfEHXKiXM1+7oaM5W/Y8W/julQJrZ8nvs4
 BAmRgtirVuFj9zqFDY63LgvuIT3uxSO6PIz3CHDdPeBwHoYf5vikAxmy/kbUg+MsnV1J0rcuutZGE
 K583yuVGv+8veAxGxdbekw0m7GsROGf0o/IIpP1/qGWwXCqwR1uyrO1ewH5gOylIfzy6UHyYSUoUr
 CNCBrET4kfc0eyD10gqd/AzvTt2WvMSK/4VDYkJRN83NG9S3iDiahpah1rW/okeVfkU4b4DFUaBga
 iWqhrxvShFqwGnvrkVGriUIt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvPk0-0005y4-Qf
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 18:33:21 +0000
Subject: Re: Windows 2019 Server getting Invalid signature with Samba 4.7.11
To: samba-technical@lists.samba.org
References: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
 <32C63F09-210A-4BCA-B603-1DFADDDC6F70@storagecraft.com>
Message-ID: <f0522438-0ab6-5fd5-aa03-f9b05cc8a2ff@samba.org>
Date: Tue, 14 Jul 2020 19:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <32C63F09-210A-4BCA-B603-1DFADDDC6F70@storagecraft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 14/07/2020 19:26, Krishna Harathi via samba-technical wrote:
> I am continuing to investigate why a client is getting an “invalid signature” error.
>
> Sequence of events
>
>    *   Smbd generated a STATUS_NETWORK_SESSION_EXPIRED for a read request
>    *   Client requested for a session (re)setup of the current/existing section (shown below)
>    *   Smbd responded with STATUS_SUCCESS but response not signed (signature with zeros) (shown below)
>    *   Windows SMBClient noted the “invalid signature” event (disruptive to client application)
>    *   Next, there was a new session setup request
>    *   Followed by smbd response with STATUS_SUCCESS with signature
>
>  From the Windows client event log, I see that there is a SMBClient/security event ID 31013  “the signing validation failed” corresponding to the time when smbd sent the session re-setup request. This caused the disconnect and disruption to application.
>
>  From the tcpdump, I see that this disconnect is followed by a new session setup request and a smbd setup response that had the response signed as expected. As far as I can tell the re-setup and the new-setup request has the same session and security parameters and flags (except for the non-zero sessionID in the re-setup request).
>
> My question at this time is (I am not an expert in this area), is the signature expected in the re-setup of existing section? Is there a issue/fix in smbd in this area?
>
> Any help in this issue is appreciated. I am working on re-creating this issue in-house, so will have more details. Please let me know what else to provide that will help.
>
> Re-setup request
>
> Transmission Control Protocol, Src Port: 27677, Dst Port: 445, Seq: 165006660, Ack: 277437573, Len: 1893
> NetBIOS Session Service
>      Message Type: Session message (0x00)
>      Length: 1889
> SMB2 (Server Message Block Protocol version 2)
>      SMB2 Header
>          ProtocolId: 0xfe534d42
>          Header Length: 64
>          Credit Charge: 1
>          Channel Sequence: 0
>          Reserved: 0000
>          Command: Session Setup (1)
>          Credits requested: 0
>          Flags: 0x00000010, Priority
>          Chain Offset: 0x00000000
>          Message ID: Unknown (7934934)
>          Process Id: 0x0000feff
>          Tree Id: 0x00000000
>          Session Id: 0x00000000da3fcdd8
>              [Authenticated in Frame: 309144]
>          Signature: 00000000000000000000000000000000
>          [Response in: 309144]
>      Session Setup Request (0x01)
>          [Preauth Hash: 9a815bcc876ca46f7727e17e42381a43e8229fde444c55a1…]
>          StructureSize: 0x0019
>              0000 0000 0001 100. = Fixed Part Length: 12
>              .... .... .... ...1 = Dynamic Part: True
>          Flags: 0
>              .... ...0 = Session Binding Request: False
>          Security mode: 0x01, Signing enabled
>              .... ...1 = Signing enabled: True
>              .... ..0. = Signing required: False
>          Capabilities: 0x00000001, DFS
>          Channel: None (0x00000000)
>          Previous Session Id: 0x0000000000000000
> [Packet size limited during capture: SMB2 truncated]
>
>
> Re-setup response –
>
> Transmission Control Protocol, Src Port: 445, Dst Port: 27677, Seq: 277437573, Ack: 165008553, Len: 239
> NetBIOS Session Service
>      Message Type: Session message (0x00)
>      Length: 235
> SMB2 (Server Message Block Protocol version 2)
>      SMB2 Header
>          ProtocolId: 0xfe534d42
>          Header Length: 64
>          Credit Charge: 1
>          NT Status: STATUS_SUCCESS (0x00000000)
>          Command: Session Setup (1)
>          Credits granted: 1
>          Flags: 0x00000011, Response, Priority
>          Chain Offset: 0x00000000
>          Message ID: Unknown (7934934)
>          Process Id: 0x0000feff
>          Tree Id: 0x00000000
>          Session Id: 0x00000000da3fcdd8
>              [Authenticated in Frame: 309144]
>          Signature: 00000000000000000000000000000000
>          [Response to: 309142]
>          [Time from request: 0.003150000 seconds]
>      Session Setup Response (0x01)
>          [Preauth Hash: 9a815bcc876ca46f7727e17e42381a43e8229fde444c55a1…]
>          StructureSize: 0x0009
>              0000 0000 0000 100. = Fixed Part Length: 4
>              .... .... .... ...1 = Dynamic Part: True
>          Session Flags: 0x0000
>              .... .... .... ...0 = Guest: False
>              .... .... .... ..0. = Null: False
>              .... .... .... .0.. = Encrypt: False
>          Blob Offset: 0x00000048
>          Blob Length: 163
>          Security Blob: a181a030819da0030a0100a10b06092a864882f712010202…
>              GSS-API Generic Security Service Application Program Interface
>                  Unknown header (class=2, pc=1, tag=1)
>                      [Expert Info (Warning/Protocol): Unknown header (class=2, pc=1, tag=1)]
>                          [Unknown header (class=2, pc=1, tag=1)]
>                          [Severity level: Warning]
>                          [Group: Protocol]
>
> Regards.
> Krishna Harathi
>
>
> From: Krishna Harathi <krishna.harathi@storagecraft.com>
> Date: Thursday, May 28, 2020 at 4:25 PM
> To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
> Subject: Windows 2019 Server getting Invalid signature with Samba 4.7.11
>
> We are using Samba 4.7.11.
>
> Windows 2019  Server SQL Backup  workload is failing (randomly) after running 5 to 6 hours with “invalid signature”, an instance of failure shown below.
>
> Write on "XXXX.bak” failed: 0x80090006(Invalid Signature.)  Msg 3013, Level 16, State 1, Server YYYY, Line 1  BACKUP DATABASE is terminating abnormally.  Outcome: Failed  Duration: 08:06:20  Date and time: 2020-05-25 01:06:21     Date and time: 2020-05-25 01:06:21.  Process Exit Code 1.  The step failed.
>
> I searched Samba buzilla and found https://bugzilla.samba.org/show_bug.cgi?id=13427 but the fix is already in 4.7.11.
>
> Is this a known issue or fix? Any help to resolve this is appreciated.
>
> Thanks.
>
> Regards.
> Krishna Harathi
>
Could you try upgrading Samba, 4.7.11 is EOL as far as Samba is 
concerned and, as Stefan said, it has probably been fixed in a later 
version.

Rowland



