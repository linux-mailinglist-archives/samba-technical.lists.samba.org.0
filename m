Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D81C1E58
	for <lists+samba-technical@lfdr.de>; Fri,  1 May 2020 22:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=sna0wX2UgjfnlpNoZW6D4SnFvf2/AA0FiQeb1zovEDc=; b=jPsEqXfcpvuLI2EHMruMvQDBU7
	CiWorLlZisTNlRqpCqpHVIklA84/JVy9Zl8qBGMEcJzcnpcCbwh7Jc4OnxKNAKNFLEtxq4bxOs6e2
	F9+1i+a97DdkV9n5nIQotLKzKKceJD/49xBpx7F19FctFQhROQQ0atujARl2FTwcJDNPdL7Mi2Dh6
	ri61g+LNwd4q53GVMLRiujfCch6kgYTjWVbBKdgOg+cmNCdqsTsg8wUBJotmkbbWtSxEtrJG9aN/N
	NO8E34hW4l4Y/k+T2+IEEm6VJd/XLlkPZi5PcKYhdkO2OIcdnExLGN4WyvPKdakXnNNijNj0AwSFh
	kBYBWrdA==;
Received: from localhost ([::1]:33778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jUcBB-002F2D-Gs; Fri, 01 May 2020 20:22:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jUcB4-002F26-Q9
 for samba-technical@lists.samba.org; Fri, 01 May 2020 20:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Message-Id:Cc:Date:From;
 bh=sna0wX2UgjfnlpNoZW6D4SnFvf2/AA0FiQeb1zovEDc=; b=206M/v0i6fmhJfXt2S2TvJrNLC
 Pul4gzgssw8pTDrC1Fdqp3GXC9w3mvkiauSOWDPR9WXjDvO/sxZ8khVV0eu7ZjFXicJGekmqhHbwq
 wjJ0FqkZAnRn7u3pkuIOmZxLEmfrWN21Jhb7CWcrxPeQUtVtQ+CYr6RhquCbFSqkdshbeX6QpEeEe
 yTeUOis7TL2yptfaFGfWn6j5tm6slTvIsyE1GWzK5d03d81j2RoOLSkvjmHURFec1bApm2v+prCD2
 tyydK806Q26c1OSfFCC5T3kPHdXENW1I8uUChxGywql8LtoZMNYidSquX5JoF8DBRADrwGngifTt6
 wkAXXJSg94FvXNZLyR3yT4c+9+A3ihngvowhX+sOMxASppF8Zhx8om2NN8NDZ8YQmfRyEs33hklN8
 asWqnPjCkiyPpNZ6riSdiFOyYbeTM5WH+4SMOAbGKg8Gy4VBSnSSeY6wV8sDVxuWH3CDlzkYcBW1T
 IywXfToWUa97aqK7x4e/gndJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jUcB4-0004Zn-7x; Fri, 01 May 2020 20:22:30 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Windows 10 client opens a folder as a file and asks for SMB2
 GetInfo SMB2_FILE_STREAM_INFO
In-Reply-To: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
Date: Fri, 1 May 2020 22:22:29 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C7E7F757-4532-4996-A485-09549E971413@samba.org>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
From: =?utf-8?q?Ralph_B=C3=B6hme_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ralph_B=C3=B6hme?= <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ashok,

Am 01.05.2020 um 17:55 schrieb Ashok Ramakrishnan via samba-technical =
<samba-technical@lists.samba.org>:
> We use 4.9.4 based samba in our product and one of our customers is =
running into a strange issue. If they right click on a folder and get =
the properties, it reports incorrect size information. When we looked at =
the network trace, we see that the client is walking the tree and =
getting information about files and folders.. Suddenly out of the blue, =
it opens a folder (which it had previous opened and closed as a =
directory) as a file (Create Options 0x00200020) and then issues a =
getino file stream info call. Samba promptly responds to this with =
NO_DATA since there is no stream associated with this folder. After =
this, things go downhill.. The client starts requesting files with paths =
without the above folder in the path and rightly gets =
STATUS_OBJECT_NAME_NOT_FOUND. We have requested our customer to open a =
support case with Microsoft to help understand the reason for the client =
behavior... But hoping someone here has had experience troubleshooting =
similar issues and can provide some tips/pointers on what to look for. I =
am primarily trying to figure out what could prompt the client to open a =
folder it knows is a folder, as a file and ask for the stream info. I =
have looked through the file ID, QFid, etc for any duplication and could =
not find any. So, why would the client do this?

well, that's one question. Another one would be how a Windows server =
responds to the exact same sequence of requests.

If I were you, I'd start with modelling an smbtorture testcase that =
replays the Windows client behaviour. Then find the first difference in =
server behaviour and work from there. Or similar, ymmv. :)

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


