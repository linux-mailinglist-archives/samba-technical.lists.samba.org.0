Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99C7EB4AE
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 17:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DOtUsCJ7nYSAZZzeVTq736xX5AlvsTk1W4gTvp1b6JY=; b=UTHqPpN4eBLmyStifqvlH2ktya
	LEIY1rwIBqtbVFGhgsrUwTk2YoEKQ9vSqrpj3R3udxVgra7uIvMtoFiRyQDkQXnZGPAv+v9igwvFZ
	suoXopW+We8PJlCyZfJKTG3W1KlBOVPJ9Q+gi9uz98uJe8hNfJpH+8xU5ABQiONKUPpd7QOK8zQ3n
	CVBPpnDDkJA1SOtGC84vAyfz4JDun61HVFkFNNG/UR//6+2B/0D73INSklEcogHrFNK+jYmOlMbq7
	vfgnCHOk2LY52wBuKjQBT1zpQkJL/1OTf3l/upH7Xh5OZ/uLExth0U+S1d8gZyZ/JnyE5BIYCorHY
	Z+UdmgfA==;
Received: from ip6-localhost ([::1]:28690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2wBI-008GpI-CV; Tue, 14 Nov 2023 16:22:28 +0000
Received: from mail-bn7nam10on20604.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::604]:57920
 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1r2wBC-008Gp9-1q
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 16:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzIPUYvnUYj17giyHSsbT/Mo7IRt+mBuLmeXcCVksQ3hUcZ9M046C/8eIBEUs2bHJExUYDzWgodTud3XlNKvq+E9Ho3sjAt59v1Xp3yYOrOieFHLSMj2C9ry7WDRTkW4PSnm01BDmQAGfSULBHg9sWHLFaMrg66qhl6qoXvLWhzgtG4r498HEnLn+4CTLo7Ak9rLu2fbxePft7hSWnsiIAuBL7/rUcckJ3kR+SLqmN73si4WQG0e3hxssNvzwf+Dtuy1mH9AtYPw/fPs2S00f3k2tJmVGUwrCpUtTp8/FLclUTLPucktjmmCF1tRObO9tzddNaJ53P0ih095zrXhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOtUsCJ7nYSAZZzeVTq736xX5AlvsTk1W4gTvp1b6JY=;
 b=BWAIJuEmnCtcubZraEWcEoNlUbecnYmuYQKO51vbnxrr7ajRVZ5r2nhPXNpBAqL7HvvpRGuAR6ebasJ2WbBo+AWn7RVHSsikMmtl8+cHYs1GWSRZ6c2TqAXHLUdNHd2XOhgoyCtH61ATcC/IMnqG5dYuyG1xsO2+tfkIY0xpSV+La0tIIFp066EvFxh2UdiImwxE7kSmZHU35HpVpqlUeWXLfnbDMU5EzoYhz8ZyWDogjtt8OGXo4/RK/xonHfgfo2+YCFH2FzijQt9a1hR49A0eNgVr8OfDLtcKj+FLkLaPHBsXd7iO3fHPg4lboybFaomIJ+KLphPoeSkzyr7gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 DS7PR01MB7615.prod.exchangelabs.com (2603:10b6:8:76::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Tue, 14 Nov 2023 16:22:07 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061])
 by SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061%2])
 with mapi id 15.20.6977.032; Tue, 14 Nov 2023 16:22:06 +0000
Message-ID: <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
Date: Tue, 14 Nov 2023 11:22:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Ralph Boehme <slow@samba.org>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
In-Reply-To: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|DS7PR01MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f6f560-0007-4097-3d14-08dbe52dd831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: OF3TRzEY2It/yyJPP1g45b1Q3V99EZ6hV0EKF9B35YDwT9avrzvMPjvx1TEnGrG2E5vG01PUT6meIZ4Gs/TgXpKxXs5XAKt21XaVskN8QsIrzadUXogvO06U75UGPANkiWqop3BHPdJ0ZuRHza6kEXXFDeQmlyBchLcWS/uAn8Fv0BKv1Knh1EeYMIGiVMz7PzgJSsWLc2Nb88oSW2cF1mjxiGLhYBcnY2ERAgF5qvbC6jOLQkGN/6jGbHNijjPmPQ4MzFfdqc49i+9I4D7oveo2bIbTidq0k4Fyi8xn+upQH03S6TXOeFDthZ12Dl91SaUCLFBUXl0lec2AoHbEigpKyjO4tUulA1ZholBHYshV31jMlstW8twumSu6b9aO4YKHxG6ULv3otbTXxpLt8PQLQbqa0E/Xl73m66k9bKq0cIAujggK89Xh/thE8Soa9Y2OoX9mS/uK6j4eDEt8DP5LSR0jTOC4d1BLpZaGm6LQlVIUS3uM74e3Pg5Lj2fophjIzrfLQYnxthPvu5abbqWb+upG1lRXz2++p+ABjqMqK6wy8KOmHoKzDPN71Re6SFQygiAIFe/3KeEOBboCR13GLg+wVGoLQ+uYg02rLqdx5wUAaeDFkp69IZ3srGTG
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmwzYXlrb2NrYUFXTitkaGRZc2p0L0JpcnVIQXhHN2FUbUNjb3J4MnBvY2wy?=
 =?utf-8?B?OHlWM09DbGZiOVY1MVU0RVNISW1MSDY1M1FXUW0xRC9STW9HOWFRREREVnFu?=
 =?utf-8?B?eTY4eTZDdEtTbWNTNlY1RWhQUjRNMktKUjErMnU1UXNCcDEvaWo2ZU9zTUNZ?=
 =?utf-8?B?eXpzYm9ra0RqdHN6b2gvaG1wSno5cTdPMVBBdkhCUStpRTZKNmc0dnNERE5W?=
 =?utf-8?B?MVJQNnczemtxLzNvaG9yckdmMTZQdTVLZW9zYTFUQzdNTmoxR2diZkFWdm8y?=
 =?utf-8?B?UmQrNTEvQ29wanIxcDBXQWI0eER0YjFpdkdGRGdvc1VtUUxJRTFucE5OYld0?=
 =?utf-8?B?SXIyNElGQlltVHNtWlZYSWh4SmYrVnIxVWpnQXgzbGNyQjB5bE9zZ1ZSN1Bm?=
 =?utf-8?B?MUwrdE14K3VZbjYrSytlbWt2dXpLb2IxaVdvN2h6dnQwcXBaMWxQUU91dGlu?=
 =?utf-8?B?Ry9hR2pmWUhvcE9mMTFDR25rZ3Jzb2xVYmNYSlZnTVcvbm9HcEMwL1Q5UTVN?=
 =?utf-8?B?NFc2c2dPUTgxMzEvcTdrME9QNm9SQmZNdUJVZ2lzcDF2TktjOTBwMVFXVkp1?=
 =?utf-8?B?MzNJSW82bEc2YWUrVi84SnBoVGpsVEZDSVh2U29DWnVaOUk2ZWpjZjFKeS9i?=
 =?utf-8?B?K3B3WWFEQ3JZaXVkQ2VMYm8ybHkwWjE0STJvZ1RyRWtuMXlXL29DWHMvRThW?=
 =?utf-8?B?OXhDN0IwRTNKR2NpY3UzdlZzRDI0aGFEbml5cE9WSVExTE9kTUhFaEpRUmZt?=
 =?utf-8?B?OXJ3Z25iK1g5WmluMDd1bG5sUEVaTlVEaUhGMENEei81T01XTEx4MGJtUWVl?=
 =?utf-8?B?RmZZcEhScHZIbGEramdIVXFtVm00V0tPallxczhKSjlkSGN1K09LeXFaQUE5?=
 =?utf-8?B?YXM3bjBNNzZROEJyV3RseEhYU1oyNFEyY3NVeGtuYUVzNU5ZSnBjM3N3dEpZ?=
 =?utf-8?B?eWprUzhSL014Nk53amk3NTMvNlpQVDNzK0VCOVY4SVJMNDVRU00xc2N4Zmwz?=
 =?utf-8?B?eEFXRW9nZFZPYjBSN0daNGV5R2ZRSEJmSk02YnZpQ2xsVGpYbWQxaFVoZ0RO?=
 =?utf-8?B?TzM1cTl1SHRxS0NxakZPdzc3ckVQOW1CV0dlUWRQN0ZRU09hQ3JqcExmMC9S?=
 =?utf-8?B?TW1oN0J6d2tJVVRPbjRXc2N5Sm1vMVdVWmtxNnhmcmdHMTM0MlNOSWQ0N1hO?=
 =?utf-8?B?Q2I4MjdWRFhxUzNmeDBWN0d5cHNZcWY2eFpwVWpmc0QxWUEyUVdCZEx3cG91?=
 =?utf-8?B?c3FraW5tNmJWVElDZDJsYlpySWdLMTJKTWNBaGxtbEZNYXFxOThxVmhFdWd5?=
 =?utf-8?B?eDZxL3J0cXArblRYeWhvenA1N2hqcHNMcGhhaStPODVRR3lBMVlkSE0zMUZW?=
 =?utf-8?B?NU9yT1JoRWpKczRzNmRxN1BUeVl3Z280RXlaZFZqbGsxbUNjanFwMXVscEhr?=
 =?utf-8?B?d0tJQnRXYS9YSHREbklJUFE1QVVTWG9wWkk2S0lHSGNtekFqTlhHdHhtamdt?=
 =?utf-8?B?VGJUOFlnbVFpME1ZQkhjQUVjZVdIbmRrWWlhR1pVekdHVGpkd2YrV0VGc1Jk?=
 =?utf-8?B?dEh6UE5OOTdWbU00b3NrZkdCU21XMlYvMlNKUDc4bGZRWXdEU0d0SS9DNkhs?=
 =?utf-8?B?UTVrQ3pydU1CNGw3SzNqTGtBSFBWbzhkdUk1b0J0NEdVbmhSL09iNzVsS2Yz?=
 =?utf-8?B?VDhnRktKMVBkcGNVY1RoWTJYZWxzaWxZOWtmdUlBM2swQXRBbERUWGRDdmdZ?=
 =?utf-8?B?YVp4TVZZc0R3R0NpNWp2R3d5TWhWZzFHWUN5MVM4a0s5OTRvbkE1N0krQ0Vl?=
 =?utf-8?B?ZWdod2Q4enBxcC9wSlNBOXJWOG9OUkZpd0cvQ1VQREhZZUlzbHkvV2JoM3Zt?=
 =?utf-8?B?b0VFV1dKRVVFSHhMclZzM0RmQkJZem9qL0poYS9QS3lxV2toMXNSa05qMWxz?=
 =?utf-8?B?dktPWWxrRVJGdUZLTlQ5cnAxQzFzaWFnQ0tmT0ZSSnlLaVhCTEptMTBNM2pD?=
 =?utf-8?B?Qjlzd0p1N0pxRU9aRURabGJ4MFMxb083aHZzRkZlOXpQK1d4YTFJb2MvSDRu?=
 =?utf-8?B?UHdYTzJJTExHVGoxRTZLeFEwRGpEUWJSUGVrejdRMHBjcThyejNYS0s4a29J?=
 =?utf-8?Q?potjpwUajZCSIUr2QFAeilqJc?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f6f560-0007-4097-3d14-08dbe52dd831
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoIxwqnkT55Ju1Pr9ldYFqdjThVymJ6lyN+pZkkg5VQL7bAyojof+5dfkHWgPdjM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7615
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8a::604
 (mail-bn7nam10on20604.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/14/2023 4:30 AM, ronnie sahlberg wrote:
> On Tue, 14 Nov 2023 at 19:16, Ralph Boehme via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> On 11/13/23 18:50, Jeremy Allison wrote:
>>> On Mon, Nov 13, 2023 at 12:28:18PM +0100, Ralph Boehme wrote:
>>>> We had support for file atttributes in the CIFS UNIX extensions, this
>>>> is currently not in the spec (or code) for SMB3 POSIX.
>>>>
>>>> Is this intentional? What is the reason?
>>>
>>> Do you mean the attributes listed by:
>>>
>>> man chattr.
>>
>> yes.
>>
>>> chattr - change file attributes on a Linux file system
>>>
>>> This was at the insitence of Steve as I recall.
>>
>> adding Steve to the loop.
>>
>>> We never implemented this.
>>>
>>> Might be done via a tunnelling ioctl ? Other thoughts ?
>>
>> well, it's a rabbit hole of its own and still seem to be rarely used on
>> Linux and the BSDs. It's not POSIX anyway so just declare it out of
>> scope for now?
> 
> Not to derail, but "chattr +i" is not a rabbithole. It is very much real.
> If you are going to set up and run bind locally on a systemd-resolved
> infected system
> you literally must use chattr +i to stop it from ruining your /etc/resolv.conf

But, does it need to be exposed to remote access? It would seem to be an
admin function, most appropriate to apply via the server-local API.

So to flip the question, does "chattr -i" (or any of the zillion others)
expose any new vulnerability if remote? Some of them look fairly juicy
targets for ransomware infiltration.

Tom.

>> The Linux interface is via ioctls so doing it over the wire via SMB2
>> IOCTLs looks like a good way forward allowing us to ignore this for now
>> and possibly add it later if there's demand and resources to implement it.
>>
>> -slow
> 

